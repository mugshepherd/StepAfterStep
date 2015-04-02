require 'active_record'


# Establishing connection to ActiveRecord.  
ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:host => "localhost",
	:database => "personal_finance_db"
)


#make sure keys are the same as the data that goes into the table

def seed_db
	account1 = Account.create(:acct_name => 'Cash', :is_on_budget => true, :acct_note => '')
	account2 = Account.create(:acct_name => 'Checking', :is_on_budget => true, :acct_note => '')
	account3 = Account.create(:acct_name => 'One Bank Visa', :is_on_budget => true, :acct_note => '')
	account4 = Account.create(:acct_name => 'American Express', :is_on_budget => true, :acct_note => '')
	account5 = Account.create(:acct_name => 'NYY MC', :is_on_budget => true, :acct_note => '')
	account6 = Account.create(:acct_name => 'Student Loan', :is_on_budget => false, :acct_note => '')
	account7 = Account.create(:acct_name => 'Mortgage', :is_on_budget => false, :acct_note => '')
	account8 = Account.create(:acct_name => 'Scottrade IRA', :is_on_budget => false, :acct_note => '$400 per month')


	transaction1 = Transaction.create(:payee => 'Ruby Tuesday', :accounts_id => 3,:category => 'Lunch', :date => '1/24/13', :debit => 104.46)
	transaction2 = Transaction.create(:payee => 'Target', :accounts_id => 3,:category => 'Groceries', :date => '5/23/13', :debit => 185.75)
	transaction3 = Transaction.create(:payee => 'Giant', :accounts_id => 3,:category => 'Groceries', :date => '12/01/14', :debit => 221.2)
	transaction4 = Transaction.create(:payee => 'Landlord', :accounts_id => 1,:category => 'Rent', :date => '2/04/14', :debit => 29)
	transaction5 = Transaction.create(:payee => 'Hershey Park', :accounts_id => 1,:category => 'Fun', :date => '2/02/15', :debit => 134.2)
	transaction6 = Transaction.create(:payee => 'Staples', :accounts_id => 1,:category => 'Personal Admin', :date => '5/16/14', :debit => 318)
	transaction6 = Transaction.create(:payee => 'Plumber', :accounts_id => 2,:category => 'Maintenance', :date => '9/28/14', :debit => 161.9)
	transaction7 = Transaction.create(:payee => 'Pepco', :accounts_id => 1,:category => 'Utilities', :date => '5/18/14', :debit => 129.2)
	transaction8 = Transaction.create(:payee => 'Walmart', :accounts_id => 2,:category => 'Household Goods', :date => '6/10/14', :debit => 137.5)

end
