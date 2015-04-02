#Create Classes
# Stating which files are used with this file.  
require "active_record"
require "pry"
require_relative "./lib/transaction.rb"
require_relative "./lib/account.rb"
require_relative "./lib/personal_finance_manager.rb"
require_relative "./lib/seeds.rb"
require 'io/console'
# STDIN.getch


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

# menu of options
def main_menu
# Main Menu
	puts	
	puts("-------------------------------------------------")
  puts("Welcome to Your Personal Finance Manager (c) 1986")
  puts("-------------------------------------------------")

loop do
  puts
	puts("Main Menu")
  puts
  puts("Type 1 to Manage your Transactions")
  puts("Type 2 to Manage your Accounts")
  puts("push any other key to quit")
  puts
  puts("Enter a number: ")


	  menu_choice = STDIN.getch
	  if menu_choice == 1
	  	transaction_management
	  elsif menu_choice == 2
	  	acct_management
	  else
	  	break
	  end
	end
end

def transaction_management
#transaction management
	puts("Transaction Management")
  puts("Type 1 to View All Transactions")
  puts("Type 2 to Add a New Transaction")
  puts("Type 3 to Edit a Transaction")
  puts("Type 4 to Delete a Transaction")
  puts("Type 5 to Filter by Category")
  puts("Press Any Other Key to Return to Main Menu")
  
  loop do
	  puts
	  puts("Enter a number: ")
	  menu_choice = gets().chomp().to_i
	  puts
	  if menu_choice == 1
	  	# view_all_transactions
	  elsif menu_choice == 2
	  	# add_new_transaction
	  elsif menu_choice == 3
	  	# edit_transaction
	  elsif menu_choice == 4
	  	# delete_transaction
	  elsif menu_choice == 5
	  	# filter_by_category
	  else
	  	break
	 	end
	end
end  

def acct_management
	puts
	puts("Account Management")
	puts("Type 1 to View All Details")
  puts("Type 2 to Add a New Account")
  puts("Type 3 to Edit Account Details")
  puts("Type 4 to Delete an Account")
  puts("Press Any Other Key to Return to Main Menu")

  loop do
		puts
	  puts("Enter a number: ")
	  menu_choice = gets().chomp().to_i
	  puts
	  if menu_choice == 1
  		# view_all_accts
	  elsif menu_choice == 2
	  	# add_new_accts
	  elsif menu_choice == 3
	  	# edit_accts
	  elsif menu_choice == 4
	  	# delete_accts
	  else
	  	break
	  end
	end
end


# create and call method to clear screen:  clear_scren 
# call seed data here 


main_menu

# seeds_db

binding.pry