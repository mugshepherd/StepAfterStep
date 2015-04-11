require "active_record"
#require "pry"

ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:host => "localhost",
	:database => "kitchen"
)

class Fridge < ActiveRecord:: Base
	has_many :foods #before_add => limit.count(10) need to confirm this validation
	has_many :drinks # before_add => limit.size(50) - need to confirm this validation
	validates_presence_of :location, :brand, :size
	
	@@fridge = []
	
	def list_fridges
		@@fridge.each_with_index do |fridge, index|
			puts ("#{index+1} on #{fridge.location}")
		end
	end
end

	
class Food < ActiveRecord:: Base
	belongs_to :fridge
end

class Drink < ActiveRecord:: Base
	belongs_to :fridge
end

class CreateKitchen < ActiveRecord:: Migration

	def initialize
		create_table :fridges do |column|
			column.string :location
			column.string :brand
			column.integer :size
		end

		create_table :foods do |column|
			column.belongs_to :fridge
			column.string :name
			column.integer :weight
			column.boolean :vegan
			column.datetime :put_in_fridge
		end

		create_table :drinks do |column|
			column.belongs_to :fridge
			column.text :name
			column.integer :size
			column.boolean :alcoholic
		end
	end
end
