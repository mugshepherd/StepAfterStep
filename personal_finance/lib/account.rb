class Account < ActiveRecord::Base
	belongs_to :transactions #, dependent: :destroy
	# validates :acct_name, :uniqueness => true
end