
#Create Classes
# Stating which files are used with this file.  
require "active_record"
require "pry"
require_relative "seeds.rb"

# Establishing connection to ActiveRecord.  
ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:host => "localhost",
	:database => "personal_finance_db"
)

# To clear tables in database
def clean_table
  ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.drop_table(table)
  end
end


class Transaction < ActiveRecord::Base
	# has_many :accounts, dependent: :destroy
	# validates :value, :date, :presence =>true
end

class Account < ActiveRecord::Base
	belongs_to :transactions #, dependent: :destroy
	validates :account_name, :uniqueness => true
end


# class Account < ActiveRecord::Base
# 	belongs_to :transactions   #does it really?
# 	validates :acc_name, :acct_note, :presence =>true
# 	valideates :acc_name, uniqueness: true
# end


#Initiate tables
class PersonalFinanceManager < ActiveRecord::Migration

	def initialize
		create_table :transactions do |column|
			column.float :debit #value of transaction in dollars  
			column.float :credit
			column.string :date
			column.string :category
			column.belongs_to :account
			column.string :note
			column.boolean :is_expense
			column.boolean :is_cleared
			column.boolean :is_flagged
		end

	

		create_table :accounts do |column|
			column.string :account_name
			column.boolean :is_on_budget
			column.string :acct_note
	
	end
end

#controller 








# seeds_db
binding.pry
end
