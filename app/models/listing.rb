class Listing < ActiveRecord::Base

	validates :name, :prompt, :application, :option, presence: true
	validates :option, length: {is: 1}
	belongs_to :user

end
