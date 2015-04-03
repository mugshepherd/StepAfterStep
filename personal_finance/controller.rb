#Create Classes
# Stating which files are used with this file.  
require "active_record"
require "pry"
require_relative "./lib/transaction.rb"
require_relative "./lib/account.rb"
require_relative "./lib/personal_finance_manager.rb"
require_relative "./lib/seeds.rb"
require 'io/console' #required to use "getch" below - which seeks 
# STDIN.getch
require  'table_print'


# Establishing connection to ActiveRecord.  
ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:host => "localhost",
	:database => "personal_finance_db"
)

# menu of options

def transaction_management
#transaction management
  loop do
	puts
	puts("Transaction Management")
  puts("Type 1 to View All Transactions")
  puts("Type 2 to Add a New Transaction")
  puts("Type 3 to Edit a Transaction")
	puts("Type 4 to Filter by Category")
  puts("Type 'd' to Delete a Transaction")
  puts("Press 0 to Return to Main Menu")  

	  puts
	  puts("Enter a number: ")
	  menu_choice = gets.chomp.to_s
	  puts
	  if menu_choice == "1"
	  	view_all_transactions
	  elsif menu_choice == "2"
	  	add_new_transaction
	  elsif menu_choice == "3"
	  	edit_transaction
	  elsif menu_choice == "4"
	  	filter_by_category
	  elsif menu_choice.downcase == "d"
	  	view_all_transactions
	  	delete_transaction
	  elsif menu_choice == "0"
	  	break
	  else
	  	puts "Incorrect input.  Please try again."
	 	end
	end
end  








def acct_management
  loop do
	puts
	puts("Account Management")
	puts("Type 1 to View All Details")
  puts("Type 2 to Add a New Account")
  puts("Type 3 to Edit Account Details")
  puts("Type 'd' to Delete an Account")
  puts("Press 0 to Return to Main Menu")

		puts
	  puts("Enter a number: ")
		menu_choice = gets.chomp.to_i
	  puts
	  if menu_choice == 1
  		view_all_accts
	  elsif menu_choice == 2
	  	add_new_accts
	  elsif menu_choice == 3
	  	edit_accts
	  elsif menu_choice == 'd'
	  	delete_accts
	  elsif menu_choice == 0
	  	break
	  else
	  	puts "Incorrect input.  Please try again."
	  end
	end
end


#View all data in database
def view_all_data
	view_all_transactions
	view_all_accts
	puts
end

#reset all data in database.  This drops tables, then recreates them (allows to update fields of data). 
def reset_database
  ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.drop_table(table)
  end
  PersonalFinanceManager.new
end

def seed_database
	reset_database
	seed_db
end

def advanced_options
	loop do
		puts
		puts "advanced_options"
		puts ("Type 'v' to View All Data in Database")
		puts("Type 'r' to Reset Database")
	  puts("Type 's to Reset and Seed with New Data")
	  puts("Type 'p' to Launch Pry at the Command Line")
	  puts("Press 0 to Return to Main Menu")

	  menu_choice = gets.chomp.to_s
	  if menu_choice.downcase == "v"
	  		view_all_data
	  elsif menu_choice.downcase == "r"
	  	reset_database
	  elsif menu_choice.downcase == "s"
	  	seed_database
	  elsif menu_choice.downcase == "p"
	  	binding.pry
	  elsif menu_choice == "0"
	  	break
	  else
	  	puts "Incorrect input.  Please try again."
	  end
	end
end


# create and call method to clear screen:  clear_scren 
# call seed data here 

# main
puts("-------------------------------------------------")
puts("Welcome to Your Personal Finance Manager (c) 1986")
puts("-------------------------------------------------")

loop do
  puts
	puts("Main Menu")
  puts
  puts("Type 1 to Manage your Transactions")
  puts("Type 2 to Manage your Accounts")
  puts("Type 3 to Configure your Database")
  puts("Press Q to Quit")
  puts
  puts("Enter a number: ")


  menu_choice = gets.chomp.to_s
  if menu_choice == "1"
  	transaction_management
  elsif menu_choice == "2"
  	acct_management
  elsif menu_choice == "3"
  	advanced_options
  elsif menu_choice.downcase == "q"
  	break
  else
  	puts "Incorrect input.  Please try again."
  end
end
# seeds_db
