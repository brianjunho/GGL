class Listing < ActiveRecord::Base

	validates :prompt, :application, :option, presence: true
	validates :application, length: { minimum: 50 }
	belongs_to :user
	has_one :edit, dependent: :destroy
	has_one :order, dependent: :destroy
	
end
