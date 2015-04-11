require "active_record"
require_relative "fridge_redux"
#require "pry"

ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:host => "localhost",
	:database => "kitchen_db"
)

#menu

#menu to perform following actions
puts "Menu"

loop do 
	puts "Welcome to your kitchen.  You have many options.  Please choose one."
	puts "1.  List all Fridges"
	puts "2.  Add a Fridge"
	puts "3.  Delete a Fridge"
	puts "4.  View all food items in a specific fridge"
	puts "5.  Add a food item to a fridge"
	puts "6.  Eat a food item from a fridge - deletes food item."  
	puts "7.  View all drink items in a specific fridge"
	puts "8.  Add a drink item to a fridge"
	puts "9.  Consume PART of a drink from a fridge - updates its size in ounces"
	puts "10.  Consume ALL of a drink in a fridge - deletes the drink"
	puts "11.  Quit program"
	
	user_input = gets.chomp.to_i

	case user_input

		when 1
			#puts all Fridges
			Fridge.all.each_with_index do |frigo, index|
				puts "#{index}:  #{frigo.location}, #{frigo.brand}, #{frigo.size}"
				puts
			end
		when 2 # add a fridge
			print "where is this fridge going to go?  "
			@location = gets.chomp
			print "Brand?  "
			@brand = gets.chomp
			print "Size, in cubic feet?  "
			@size = gets.chomp.to_i
			@f = Fridge.new(:location => @location, :brand => @brand, :size => @size)
			@f.valid?
				if @f.valid?
					@f.save
				else
					puts (@f.errors)
				end

			Fridge.all.each_with_index do |f|
				puts "#{f.location}, #{f.brand}, #{f.size}"
				puts
			end
		when 3 #delete a fridge
			#list all fridges
			puts "Please select a fridge to delete"
			Fridge.all.each_with_index do |frigo, index|
				puts "#{index}:  #{frigo.location}, #{frigo.brand}, #{frigo.size}"
			end

			@user_input = gets.chomp.to_i
			Fridge.all.delete_at(@user_input)

		when 4
		when 5
		when 6
		when 7
		when 8
		when 9
		when 10
		when 11
			puts "exiting"
			break
	end

end
