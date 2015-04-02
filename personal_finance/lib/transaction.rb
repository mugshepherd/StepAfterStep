
class Transaction < ActiveRecord::Base
	# has_many :accounts, dependent: :destroy
	validates (:debit || :credit), :date, :presence =>true
	belongs_to :accounts
end

def view_all_transactions
	puts
	puts "All Transaction Data:"
	tp Transaction.all
		# puts "#{listing.value}	#{listing.date}	#{listing.debit}	#{listing.credit}"
end


def add_new_transaction inputCredit = nil, inputDebit
	

	### stopped here.  this stopped working
		puts("Press 1 if Credit, Press 2 if Debit")  
		puts 
		menu_choice = gets.chomp.to_i
		loop do
			if menu_choice == 1 #input credit
				puts "Amount of credit:"
				new_credit = gets.chomp.to_i
				puts new_credit
				puts "adding new_credit!"
			elsif menu_choice == 2 #input debit
				puts "Amount of debit:"
				new_debit = gets.chomp.to_i
			else
				puts "Choose a valid selection"
			break
			end
		puts "Date:"
		new_date = gets.chomp.to_s
		puts "Category:"
		new_category = gets.chomp.to_s
		puts "Payee:"
		new_payee = gets.chomp.to_s
		puts "Select Account ID number"
		tp Account.all
		new_transaction_account = gets.chomp.to_i
		puts "Insert Note, if any"
		new_note = gets.chomp.to_s
	end
	transaction_new = Transaction.new(credit: new_credit, debit: new_debit, accounts_id: new_transaction_account, category: new_category, payee: new_payee)
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