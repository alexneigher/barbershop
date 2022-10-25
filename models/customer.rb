require 'state_machines'

class Customer
  MIN_HAIRCUT_DURATION = 1200 # seconds
  MAX_HAIRCUT_DURATION = 2400 # seconds

  attr_accessor :shop, :seated_at, :name, :haircut_started_at, :working_with, :haircut_duration

  state_machine :status, initial: :new do
    #statuses new, waiting, receiving_haircut, left_dissapointed, left_unfulfilled

    after_transition to: :waiting do |customer, _transition|
      Logger.log(customer.shop.current_time, "#{customer.name} entered")
    end

    after_transition to: :left_unfulfilled do |customer, _transition|
      Logger.log(customer.shop.current_time, "#{customer.name} leaves unfulfilled")
    end

    after_transition to: :left_dissapointed do |customer, _transition|
      Logger.log(customer.shop.current_time, "#{customer.name} leaves disappointed")
    end

    after_transition to: :left_frustrated do |customer, _transition|
      Logger.log(customer.shop.current_time, "#{customer.name} leaves frustrated")
    end

    after_transition to: :satisfied do |customer, _transition|
      Logger.log(customer.shop.current_time, "#{customer.name} leaves satisfied")
    end

    event :enter_waiting_room! do
      transition new: :waiting
    end

    event :ask_to_leave_unfulfilled! do
      transition new: :left_unfulfilled
    end

    event :leave_disapointed! do
      transition waiting: :left_disapointed
    end

    event :leave_frustrated! do
      transition waiting: :left_frustrated
    end

    event :leave_satisfied! do
      transition all => :satisfied
    end
  end

  def initialize(name, shop, seated_at = 0)
    @name = name
    @shop = shop
    @seated_at = seated_at
    @haircut_started_at = nil
    @working_with = nil
    @haircut_duration = rand(MIN_HAIRCUT_DURATION..MAX_HAIRCUT_DURATION)
    super()
  end
end