class Listing < ActiveRecord::Base

	validates :name, :prompt, :application, :option, presence: true

end
