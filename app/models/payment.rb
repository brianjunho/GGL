class Payment < ActiveRecord::Base
	belongs_to :proofreader, class_name: "User"
	validates :legalname, :request, presence: true
	
end
