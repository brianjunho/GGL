class User < ActiveRecord::Base
	
    has_attached_file :avatar, :styles => { :medium => "200x200", :thumb => "200x200>" }, :default_url => "https://dl.dropboxusercontent.com/s/dg0tkzo002cvsf1/Default.png"
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  has_many :listings, dependent: :destroy
  has_many :requests, class_name: "Edit", foreign_key: "requester_id"
  has_many :edits, class_name: "Edit", foreign_key: "editor_id"
end
