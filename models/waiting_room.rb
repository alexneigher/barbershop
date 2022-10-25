class WaitingRoom
  MAX_CHAIRS = 4

  attr_accessor :customers

  def initialize()
    @customers = []
  end

  def is_empty?
    @customers.length.zero?
  end

  def has_capacity?
    @customers.length < MAX_CHAIRS
  end

  def pop(customer)
    @customers = [@customers - [customer]].flatten
  end
end