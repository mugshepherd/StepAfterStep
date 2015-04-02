
class Transaction < ActiveRecord::Base
	# has_many :accounts, dependent: :destroy
	validates :value, :date, :presence =>true
end