class Edit < ActiveRecord::Base
	validates :proofread, presence: true
	belongs_to :listing
	belongs_to :editor, class_name: "User"
	belongs_to :requester, class_name: "User"
	has_one :proofread1, dependent: :destroy
	has_one :relisting, dependent: :destroy
end
