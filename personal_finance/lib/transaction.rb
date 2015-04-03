
class Transaction < ActiveRecord::Base
	# has_many :accounts, dependent: :destroy
	validates :value, :date, :presence =>true
	belongs_to :accounts
end

def view_all_transactions
	current_balance
	puts
	tp Transaction.order(:date), :id, :date, :accounts_id, :payee, :category, :note, :is_credit, :value
end

def select_transaction
	puts "select_transaction method"
	view_all_transactions
	puts
	print "Please select an ID number:  "
	return menu_choice = gets.chomp.to_i
end

def add_new_transaction
	print ` clear `
	current_balance
	@new_entry_is_credit = nil
	loop do
		puts "Add a new transaction"
		puts("Press 1 if this is a Credit, Press 2 if Debit") 
		menu_choice = gets.chomp.to_i
		if menu_choice == 1 #input credit
			@new_entry_is_credit = true
			break
		elsif menu_choice == 2 #input debit
			@new_entry_is_credit = false
			break
		else
			puts "Invalid entry.  Please try again."
		end
	end
	print "Amount of Transaction:  "
	new_value = gets.chomp.to_i
	print "Date - (MM/DD/YY):  "
	new_date = gets.chomp.to_s
	print "Category:  "
	new_category = gets.chomp.to_s
	print "Payee:  "
	new_payee = gets.chomp.to_s	
	puts "Select Account ID number:  "
	puts
	tp Account.all
	new_transaction_account = gets.chomp.to_i
	puts
	print "Insert Note, if any:  "
	new_note = gets.chomp.to_s
	transaction_new = Transaction.create(:is_credit => @new_entry_is_credit, :value => new_value, :date => new_date, :category => new_category, :payee => new_payee, :accounts_id => new_transaction_account, :note => new_note)
	puts
	puts "New Transaction Entered:  "
	puts
	return tp transaction_new	
end


#left off here
def delete_transaction selected_transaction
	tp Transaction.find(:id => selected_transaction)
	puts "Please press 'd' again to delete"
	user_input = gets.chomp.to_s
	if user_input == "d"
		Transaction.find(selected_transaction).delete
	else
		puts "Returning to previous menu."
	end
end

def edit_transaction selected_transaction
	loop do
		puts
		tp Transaction.find(:id => selected_transaction)
		puts
		puts "Edit Transaction"
		puts "----------------------------------"
	  puts("Type 1 to Update Transaction Type (ie: debit or credit)")
	  puts("Type 2 to Update Value of Transaction")
	  puts("Type 3 to Update Date")
	  puts("Type 4 to Update Category")
	  puts("Type 5 to Update Payee")
	  puts("Type 6 to Update Account")
	  puts("Type 7 to Update Note")
	  puts("Type 0 to return to Main Menu")
	  puts
	  puts("Enter a number: ")
	  menu_choice = gets.chomp.to_s		
	  puts
	  
	  if menu_choice == "1" #update credit or debit
			print "Is this a Credit?  type 'true' if so, 'false' if not"	
			updated_is_credit = gets.chomp.to_s
			transaction_updated = Transaction.update(selected_transaction, :is_credit => updated_is_credit)

	  elsif menu_choice == "2" #update value of transaction
	  	print "Currently:  #{Transaction.find(selected_transaction).value}"
	  	updated_value = gets.chomp.to_i
			transaction_updated = Transaction.update(selected_transaction, :value => updated_value)

	  elsif menu_choice == "3"  #update date
	  	print "Currently:  #{Transaction.find(selected_transaction).date}"
	  	updated_date = gets.chomp.to_s
	  	transaction_updated = Transaction.update(selected_transaction, :date => updated_date)

	  elsif menu_choice == "4"  #update category
			print "Category:  "
			updated_value = gets.chomp.to_s
				if (string =~ /^[0-1]\d\/[0-3]?\d\/\d{4}/)
					transaction_updated = Transaction.update(selected_transaction, :category => updated_category)
				else
				return false
				end
		
	  elsif menu_choice == "5" #update payee
	  	print "Payee:  "
			updated_payee = gets.chomp.to_s
			transaction_updated = Transaction.update(selected_transaction,:payee => updated_payee)

	  elsif menu_choice == "6" #update account
	  	puts
			puts "Select an updated Account ID."
			puts
			view_all_accts
			puts
			updated_account_id = gets.chomp.to_i
			transaction_updated = Transaction.update(selected_transaction, :accounts_id => updated_account_id)

	  elsif menu_choice == "7" #update note
	  	print "Note:  "
	  	updated_note = gets.chomp.to_s
	  	transaction_updated = Transaction.update(selected_transaction, :note => updated_note)
	  
	  elsif menu_choice == "0" #main menu
	  	break
	  
	  else 
	  	puts "Invalid selection.  Please try again."
	  
	  end
	  puts
	end
	# transaction_updated = Transaction.update(selected_transaction, :is_credit => updated_is_credit, :value => updated_value, :date => updated_date, :category => updated_category, :payee => updated_payee, :accounts_id => updated_account_id, :note => updated_note)
end



def filter_by_category
	puts "filter_by_category"
	puts "Under development.  Return to main menu"
end