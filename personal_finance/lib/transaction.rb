
class Transaction < ActiveRecord::Base
	# has_many :accounts, dependent: :destroy
	validates :value, :date, :presence =>true
	belongs_to :accounts
end

def view_all_transactions
	puts
	tp Transaction.all
	puts
		# puts "#{listing.value}	#{listing.date}	#{listing.debit}	#{listing.credit}"
end


def add_new_transaction

	### stopped here.  this stopped working
	@new_entry_is_credit = nil

	puts("Press 1 if Credit, Press 2 if Debit")  
	puts 
	menu_choice = gets.chomp.to_i
	loop do
		if menu_choice == 1 #input credit
			@new_entry_is_credit = true
			break
		elsif menu_choice == 2 #input debi
			@new_entry_is_credit = false
			break
		else
			puts "Invalid entry.  Please try again."
		end
	end
	puts "Amount of Transaction:"
	new_value = gets.chomp.to_i
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

	transaction_new = Transaction.create(:is_credit => @new_entry_is_credit, :value => new_value, :date => new_date, :category => new_category, :payee => new_payee, :accounts_id => new_transaction_account, :note => new_note)
end



def edit_transaction 
	
	puts "Select an entry to edit"
	view_all_transactions
	puts
	print "Please select an ID number"
	transaction_to_edit = gets.chomp.to_i
	# puts Transaction.find(transaction_to_edit).inspect
	puts "Selected Transaction Overview:  "
	tp Transaction.where(:id => transaction_to_edit)
	
	puts "Please enter corrected values for each field."
	# if Transaction.find(transaction_to_edit).is_credit == true
	puts "Transaction is a Credit - currently:  #{Transaction.find(transaction_to_edit).is_credit}"
	updated_is_credit = gets.chomp.to_i
	puts "Value - currently:  #{Transaction.find(transaction_to_edit).value}"
	updated_value = gets.chomp.to_i
	
	puts "Date - currently:  #{Transaction.find(transaction_to_edit).date}"
	updated_date = gets.chomp.to_s
	
	puts "Category - currently:  #{Transaction.find(transaction_to_edit).category}"
	updated_category = gets.chomp.to_s
	
	puts "Payee - currently:  #{Transaction.find(transaction_to_edit).payee}"
	updated_payee = gets.chomp.to_s
	
	puts "Account - currently:  #{Transaction.find(transaction_to_edit).accounts_id}"
	puts "Select an updated Account ID."
	view_all_accts
	puts
	updated_account_id = gets.chomp.to_i

	puts "Note - currently:  #{Transaction.find(transaction_to_edit).note}"
	updated_note = gets.chomp.to_s
	

	transaction_updated = Transaction.update(transaction_to_edit, :is_credit => updated_is_credit, :value => updated_value, :date => updated_date, :category => updated_category, :payee => updated_payee, :accounts_id => updated_account_id, :note => updated_note)

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