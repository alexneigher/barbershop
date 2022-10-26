require 'state_machines'

class Barbershop
  attr_accessor :current_time, :waiting_room, :shop_name, :active_barbers

  OPENING_TIME = 32400 # seconds
  CLOSING_TIME = 61200 # seconds
  SHIFT_CHANGE = 46800 #seconds
  MAX_WAITING_ROOM_DURATION = 1200 # seconds

  FIRST_SHIFT = [ Barber.new("Steve"), Barber.new("Sarah"), Barber.new("James"), Barber.new("Jess") ]
  SECOND_SHIFT = [ Barber.new("Roger"), Barber.new("Billy"), Barber.new("Nancy"), Barber.new("Sue") ]

  ### State for OPEN/CLOSED
  state_machine :state, initial: :closed do
    #states open, closing, closed
    after_transition to: :open do |shop, _transition|
      Logger.log(shop.current_time, "#{shop.shop_name} is open for business!")
    end

    after_transition to: :closed do |shop, _transition|
      Logger.log(shop.current_time, "#{shop.shop_name} is closed.")
    end

    event :open! do
      transition closed: :open
    end

    event :try_to_close! do
      transition open: :closing
    end

    event :close! do
      transition closing: :closed, if: ->(shop) { shop.waiting_room.is_empty? && shop.active_barbers.all?{|b| b.available? } }
    end

    event :try_to_close! do
      transition open: :closing
    end
  end
  ######

  def initialize(shop_name, current_time = 0, waiting_room = WaitingRoom.new())
    @shop_name = shop_name
    @current_time = current_time
    @waiting_room = waiting_room
    @active_barbers = []
    @customer_count = 1
    super()
  end

  def introduce_new_customer
    customer = Customer.new("Customer-#{@customer_count}", self)
    case state
      when "open"
      maybe_add_to_waiting_room(customer)
      @customer_count += 1

      when "closing", "closed"
        customer.leave_disapointed!
        @customer_count += 1
    end
  end

  def check_open_closed_status
    self.should_open?
    self.should_close?
  end

  # TODO REFACTOR THIS
  # This needs to be decoupled into a ShiftChangerService or something else to decouple it.
  # if no shift if active, clock in 1st shift
  # if the shift change time has elapsed, iterate through list and as they become free, swap them for second shift
  # if the time is after closing, try to clock out the remaining working people if they're still on the clock
  def check_shift_change
    if @current_time >= OPENING_TIME && @current_time < SHIFT_CHANGE && self.active_barbers.empty?
      FIRST_SHIFT.each do |barber|
        barber.shop = self
        barber.clock_in!
      end
      self.active_barbers = FIRST_SHIFT

    # this is risky, if we miss this exact timestamp, the second shift never clocks in
    # clock in second shift
    elsif @current_time == SHIFT_CHANGE
      SECOND_SHIFT.each do |barber|
        barber.shop = self
        barber.clock_in!
      end
      self.active_barbers = [self.active_barbers + SECOND_SHIFT].flatten

    # after the switchover time
    # clock people out as people become available
    elsif @current_time > SHIFT_CHANGE && @current_time <= CLOSING_TIME
      available_barbers_from_shift(FIRST_SHIFT).each do |b|
        b.clock_out!
        self.active_barbers = [self.active_barbers - [b]].flatten
      end
    # after closing time, clock people out as they finish work
    elsif @current_time > CLOSING_TIME
      available_barbers_from_shift(SECOND_SHIFT).each do |b|
        b.clock_out!
        self.active_barbers = [self.active_barbers - [b]].flatten
      end
    end

  end

  #if there are available barbers and customers waiting, fetch a new customer
  def check_waiting_room
    return unless self.open? || self.closing?

    #all customers are currently being served
    return if waiting_room.is_empty?

    #if there are available barbers assign a customer to one
    if (barber = @active_barbers.find{ |b| b.available? })
      # grab the customer in the queue that has been waiting longest
      customer = waiting_room.customers.first

      barber.engage_with(customer, @current_time)
      waiting_room.pop(customer)
    else
      #no available barbers
    end

    #check to see if anyone leaves after 20 minutes of waiting
    # TODO this is very exponential time complexity (maybe use hash lookup instead?)
    waiting_room.customers.each do |c|
      if (@current_time - c.seated_at) >= MAX_WAITING_ROOM_DURATION
        c.leave_frustrated!
        waiting_room.pop(c)
      end
    end
  end

  def check_haircut_progress
    return unless self.open? || self.closing?

    #nobody is actively cutting hair
    barbers_currently_working = @active_barbers.select{ |b| b.busy? }

    # iterate through all barbers and see how long theve been working
    # if they've been working longer than the haircut duration, finish that session and release
    # the resources
    barbers_currently_working.each do |barber|
      haircut_duration = barber.working_with.haircut_duration
      haircut_started_at = barber.working_with.haircut_started_at

      if (@current_time - haircut_started_at) >= haircut_duration
        #this haircut has finished
        barber.complete_haircut(barber.working_with, @current_time)
      end

    end
  end

  def should_open?
    # maybe refactor: if we miss the exact timestamp, this will never open
    if @current_time == OPENING_TIME
      self.open!
    end
  end

  def should_close?
    #check to see if the shop is empty. If so close, if not continue
    if @current_time >= CLOSING_TIME
      self.try_to_close! #this will go from open to closing to stop new customers
      self.close! #this will only go from closing to closed if the waiting room is empty
    end
  end

  def current_time=(new_time)
    @current_time = new_time
  end

  def available_barbers_from_shift(shift)
    [@active_barbers & shift].flatten.select{|b| b.available? }
  end

  # if we have room maybe
  # refactor this logic to live on waiting room
  def maybe_add_to_waiting_room(new_customer)

    if waiting_room.has_capacity?
      #add new customer to waiting room
      waiting_room.customers << new_customer
      new_customer.enter_waiting_room!
      new_customer.seated_at = @current_time
    else
      #turn customer away
      new_customer.ask_to_leave_unfulfilled!
    end

  end
end