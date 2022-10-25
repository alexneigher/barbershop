require 'state_machines'

class Barber
  attr_accessor :working_with, :name

  state_machine :work_status, initial: :not_working do
    #states => not_working, at_work, available, busy

    after_transition to: :busy do |barber, _transition|
      Logger.log(barber.working_with.haircut_started_at, "#{barber.name} started cutting #{barber.working_with.name}’s hair")
    end

    after_transition from: :busy, to: :available do |barber, transition|
      Logger.log(barber.working_with.haircut_started_at, "#{barber.name} finished cutting #{barber.working_with.name}’s hair")
    end

    event :clock_in! do
      transition not_working: :working
    end

    #only allow someone to clock out if they're not working
    event :clock_out! do
      transition available: :not_working
    end

    #TODO refactor this to not transition from not working (need to click in /clock out)
    event :become_busy! do
      transition [:not_working, :at_work, :available] => :busy
    end

    event :become_available! do
      transition busy: :available
    end
  end

  def initialize(name)
    @name = name
    @working_with = nil
    super()
  end

  #has side effects on customer, maybe refactor?
  def engage_with(customer, current_time)
    self.working_with= customer
    customer.haircut_started_at = current_time
    customer.working_with = self

    self.become_busy!
  end

  #also has side effects on customer maybe refactor
  def complete_haircut(customer, current_time)
    self.become_available!
    self.working_with= nil
    customer.working_with = nil
    customer.leave_satisfied!
  end

  def available?
    self.working_with.nil?
  end
end