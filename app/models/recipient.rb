class Recipient < ActiveRecord::Base
	belongs_to :user
	has_many :users
	has_one :phone
end
