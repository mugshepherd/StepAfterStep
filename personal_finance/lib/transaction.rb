
class Transaction < ActiveRecord::Base
	# has_many :accounts, dependent: :destroy
	validates value, :date, :presence =>true
	belongs_to :accounts
end

def view_all_transactions
	puts
	puts "All Transaction Data:"
	tp Transaction.all
		# puts "#{listing.value}	#{listing.date}	#{listing.debit}	#{listing.credit}"
end


def add_new_transaction

	### stopped here.  this stopped working
	new_entry_is_credit = nil

		puts("Press 1 if Credit, Press 2 if Debit")  
		puts 
		menu_choice = gets.chomp.to_i
		loop do |variable|
			if menu_choice == 1 #input credit
				new_entry_is_credit = true
				break
			elsif menu_choice == 2 #input debi
				new_entry_is_credit = false
				break
			else
				puts "Invalid entry.  Please try again."
			end
		end
		puts "Amount of Transaction:"
		new_value = gets.chomp.to_i
		else
			puts "Choose a valid selection"
		break
		end
		puts "Date:  "
		new_date = gets.chomp.to_s
		puts "Category:  "
		new_category = gets.chomp.to_s
		puts "Payee:  "
		new_payee = gets.chomp.to_s
		puts "Select Account ID number"
		tp Account.all
		new_transaction_account = gets.chomp.to_i
		puts "Insert Note, if any"
		new_note = gets.chomp.to_s
	end
	transaction_new = Transaction.new(:value => new_value, :is_credit => new_entry_is_credit, :accounts_id => new_transaction_account, :category => new_category, :payee => new_payee)
end

def edit_transaction
	puts "edit_transaction"
	puts "Under development.  Return to main menu"
end

def delete_transaction
	puts "delete_transaction"
	puts "Under development.  Return to main menu"	
end

def filter_by_category
	puts "filter_by_category"
	puts "Under development.  Return to main menu"
end