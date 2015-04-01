
#Create Classes
# Stating which files are used with this file.  
require "active_record"
require "pry"

#connection, the "clean_table" method, validations for attributes for Class and Category class
#and non-MVP require relation Account are commented out to verify "personal_finance_spec" file
#runs correctly

# Establishing connection to ActiveRecord.  
# ActiveRecord::Base.establish_connection(
# 	:adapter => "postgresql",
# 	:host => "localhost",
# 	:database => "kitchen_db"
# )

# To clear tables in database
# def clean_table
#   ActiveRecord::Base.connection.tables.each do |table|
#   ActiveRecord::Base.connection.drop_table(table)
#   end
# end


class Transaction < ActiveRecord::Base
	# has_many :categories, dependent: :destroy
	# # has_many :accounts, dependent: :destroy
	# validates :value, :date, :presence =>true
end

class Category < ActiveRecord::Base
	# belongs_to :transactions #, dependent: :destroy
	# validates :cat_name
end

# class Account < ActiveRecord::Base
# 	belongs_to :transactions   #does it really?
# 	validates :acc_name, :acct_note, :presence =>true
# end




#Initiate tables
class PersonalFinanceManager < ActiveRecord::Migration

	def initialize
		create_table :transactions do |column|
			column.float :value #value of transaction in dollars  
			column.date :date
			column.belongs_to :category
			#column.belongs_to :account
			#column.string :note
			#column.boolean :is_cleared
			#column.boolean :flag
		end

		create_table :categories do |column|
			column.string :cat_name 
			#column.belongs_to :cat_parent
			#column.string :cat_note
		end

		# create_table :accounts do |column|
		# 	column.string :acct_name
		# 	column.boolean :is_on_budget
		# 	column.string :acct_note
	
	end
end

binding.pry