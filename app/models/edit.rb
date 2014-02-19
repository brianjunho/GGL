class Edit < ActiveRecord::Base
	validates :proofread, presence: true
	belongs_to :listing
	belongs_to :editor, class_name: "User"
	belongs_to :requester, class_name: "User"
end
