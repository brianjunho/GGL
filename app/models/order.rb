class Order < ActiveRecord::Base
	
	belongs_to :listing
	belongs_to :customer, class_name: "User"
end
 	