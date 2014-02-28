class Proofread1 < ActiveRecord::Base
	belongs_to :edit
	belongs_to :proofreader, class_name: "User"
end
