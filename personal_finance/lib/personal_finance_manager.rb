class PersonalFinanceManager < ActiveRecord::Migration

	def initialize
		create_table :transactions do |column|
			column.float :value #value of transaction in dollars  
			column.boolean :is_credit #true if credit, false if debit.
			column.string :date
			column.string :category
			column.string :payee
			column.belongs_to :accounts
			column.string :note
		end	

		create_table :accounts do |column|
			column.string :acct_name
			column.boolean :is_on_budget
			column.string :acct_note
		end
	
	end
end

