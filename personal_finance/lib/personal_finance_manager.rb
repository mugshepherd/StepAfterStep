class PersonalFinanceManager < ActiveRecord::Migration

	def initialize
		create_table :transactions do |column|
			column.float :debit #value of transaction in dollars  
			column.float :credit
			column.string :date
			column.string :category
			column.belongs_to :account
			column.string :note
			column.boolean :is_cleared
			column.boolean :is_flagged
		end	

		create_table :accounts do |column|
			column.string :acct_name
			column.boolean :is_on_budget
			column.string :acct_note
		end
	
	end
end