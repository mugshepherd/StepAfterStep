class Category < ActiveRecord::Base
	belongs_to :transactions #, dependent: :destroy
	validates :category_name, :uniqueness => true
end