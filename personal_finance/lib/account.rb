class Account < ActiveRecord::Base
	has_many :transactions #, dependent: :destroy
	# validates :acct_name, :uniqueness => true
end

def acct_total
	puts
	balance = Transaction.sum(:values).where(:is_credit => true) - Transaction.sum(:values).where(:is_credit => false)
	puts balance
end


##Methods related to accounts

def view_all_accts
	puts
	puts "All Account Information:"
	tp Account.all
end

def add_new_accts	
	puts "add_new_accts"
	puts "Under development.  Return to main menu"
end

def edit_accts
	puts "edit_accts"
	puts "Under development.  Return to main menu"
end

def delete_accts
	puts "delete_accts"
	puts "Under development.  Return to main menu"
end