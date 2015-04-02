#RSPEC file testing classes used in Personal Finance project (GA WDI #5, wk3)

require_relative "../lib/personal_finance.rb"


#test Transacation class

describe Transaction do
	lunch = PersonalFinanceManager.new(10,)
	it "has a value" do
		expect(Transaction.


	end
	it "has a category" do
	end
	it "has a date" do
	end
end


describe Transaction do
	subject (:transaction) do	
		Transaction.new(10, "groceries", "some date value here")
	end

	context "when adding a new transaction" do
		it "accepts a value" do
		end

		it "accepts a category" do
		end

		it "accepts a date" do
		end

		it "rejects non values" do
		end

		it "rejects non categories" do
		end

		it "rejects non dates" do
		end
	end

	context "when editing a transaction" do

		it "updates the original value" do
		end

		it "updates the category" do
		end

		it "updates the date" do
		end
	end

	context "when deleting a transaction" do 
		
		it "deletes the transaction" do
		end
	end

	context "when filtering by category" do
		it "should only show transactions of that category" do
		end
	end

	context "when quitting the command line" do
		it "holds on to its data in source data table" do
		end
	end
end



#testing Category class
describe Category do
	it "has a name" do
	end
end

describe Category do
	subject (:category) do	
		Category.new("groceries")
	end

	it "has a name" do
	end

	context "when adding a new category" do
		it "accepts a name" do
		end

		it "does not accept a non-string" do
		end

		it "must not be blank" do
		end
	end

	context "when updating a category name" do
		it "updates the original value" do
		end

		it "updates categories for related transactions" do
		end
	end
end