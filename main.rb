#!/usr/bin/ruby
###Brenden Price, Ruby Programming, 1/6/2021
### Assignment three, create a class to represent a vending Machine
### Creates three subclasses representing items in the machine
### Tracks the cost, name, supply, and number for items
### Tracks the same plus total sale amount and total stock in machine for the Machine
### provides methods to update or access applicable values


###Updated to have sales log. It appends to the end of the file whenever something is purchased and creates the file if it doesn't exost
###Read log has a default paramenter to determine whether to read the whole log or count occurrences
require_relative 'VendorFood'
require_relative 'CandyBar'
require_relative 'Chips'
require_relative 'Crackers'
machine = VendorFood.new(nil, nil, nil) #Instantiated just to call machine.sales at end
hershey_bar = CandyBar.new("Hershey", 1.99, 101)
potato_chips = Chips.new("Potato", 0.75, 201)
saltine_crackers = Crackers.new("Saltine", 74.99, 154)

potato_chips.stock_item(1)

hershey_bar.stock_item(17)

hershey_bar.vend_item

hershey_bar.to_s

potato_chips.vend_item

potato_chips.to_s

saltine_crackers.to_s

puts "Total sales: " << machine.sales.to_s

machine.read_log("101")
machine.read_log("Potato")
machine.read_log("Ruby")
puts "\n\n\n"
machine.read_log
