
class Transaction < ActiveRecord::Base
	# has_many :accounts, dependent: :destroy
	validates :value, :date, :presence =>true
	belongs_to :accounts
end

def view_all_transactions
	puts
	tp Transaction.all
end

def select_transaction
end

def add_new_transaction
	print ` clear `
	@new_entry_is_credit = nil
	loop do
		puts "Add a new transaction"
		puts("Press 1 if this is a Credit, Press 2 if Debit")  
		puts 
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
	puts "Amount of Transaction:"
	new_value = gets.chomp.to_i
	puts "Date:  (MM/DD/YY)"
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
	puts "New Transaction Entered:  "
	return tp transaction_new	
end


#left off here
def delete_transaction goner
	puts "Please press 'd' again to delete"
	selection_drop_confirm = gets.chomp.to_s
	if selection_drop_confirm == "d"
		Transaction.find(goner).delete
	else
		puts "Returning to previous menu."
	end
end

def edit_transaction 
	loop do
		puts "Select an entry to edit"
		view_all_transactions
		puts
		print "Please select an ID number"
		transaction_to_edit = gets.chomp.to_i
		# puts Transaction.find(transaction_to_edit).inspect

		puts "Please select field to edit, or press RETURN for the previous menu"

		puts "Selected Transaction Overview:  "
		tp Transaction.where(:id => transaction_to_edit)
		puts
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
			menu_choice = gets.chomp.to_i
			puts "Currently:  #{Transaction.find(transaction_to_edit).is_credit}"
			updated_is_credit = gets.chomp.to_s
			transaction_updated = Transaction.atrribute(transaction_to_edit, :is_credit => updated_is_credit)

	  elsif menu_choice == "2" #update value of transaction
	  	puts "Currently:  #{Transaction.find(transaction_to_edit).value}"
	  	updated_value = gets.chomp.to_i
			transaction_updated = Transaction.update(transaction_to_edit, :value => updated_value)

	  elsif menu_choice == "3"  #update date
	  	puts "Currently:  #{Transaction.find(transaction_to_edit).date}"
	  	updated_date = gets.chomp.to_s
	  	transaction_updated = Transaction.update(transaction_to_edit, :date => updated_date)

	  elsif menu_choice == "4"  #update category
			puts "Currently:  #{Transaction.find(transaction_to_edit).category}"
			updated_value = gets.chomp.to_s
			transaction_updated = Transaction.update(transaction_to_edit, :category => updated_category)

	  elsif menu_choice == "5" #update payee
	  	puts "Currently:  #{Transaction.find(transaction_to_edit).payee}"
			updated_payee = gets.chomp.to_s
			transaction_updated = Transaction.update(transaction_to_edit,:payee => updated_payee)

	  elsif menu_choice == "6" #update account
	  	puts "Account - currently:  #{Transaction.find(transaction_to_edit).accounts_id}"
			puts "Select an updated Account ID."
			view_all_accts
			puts
			updated_account_id = gets.chomp.to_i
			transaction_updated = Transaction.update(transaction_to_edit, :accounts_id => updated_account_id)

	  elsif menu_choice == "7" #update note
	  	puts "Note - currently:  #{Transaction.find(transaction_to_edit).note}"
	  	updated_note = gets.chomp.to_s
	  	transaction_updated = Transaction.update(transaction_to_edit, :note => updated_note)
	  else 
	  	puts "Invalid selection.  Please try again."
	  end
	  puts
	end
	# transaction_updated = Transaction.update(transaction_to_edit, :is_credit => updated_is_credit, :value => updated_value, :date => updated_date, :category => updated_category, :payee => updated_payee, :accounts_id => updated_account_id, :note => updated_note)
end



def filter_by_category
	puts "filter_by_category"
	puts "Under development.  Return to main menu"
end