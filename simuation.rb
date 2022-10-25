#!/usr/bin/ruby
require 'pry'
Dir["utilities/*.rb"].each {|file| require_relative file }
Dir["models/*.rb"].each {|file| require_relative file }

## Constants
TOTAL_SECONDS = 86399.freeze # number of seconds in a 24 hour period
##

## "main variables
elapsed_seconds = Barbershop::OPENING_TIME - 300 # start the simulation 5 minutes before open
shop = Barbershop.new("Family Cuts")
##

# "main" loop
while elapsed_seconds <= TOTAL_SECONDS
  #each iteration check if the shop is in the right state
  shop.check_open_closed_status

  # make sure the right barbers are on shift
  # shop.check_shift_change

  #see if we can assign any customers to barbers or release them from the queue
  shop.check_waiting_room

  #check active haircut progress
  shop.check_haircut_progress

  # every 5 minutes while the shop is open introduce a new customer
  if (elapsed_seconds % 300 == 0)
    shop.introduce_new_customer
  end

  shop.current_time = elapsed_seconds
  elapsed_seconds += 1
end

###Open Questions:
# Not described: what happens when someone tries to come in before the shop opens?