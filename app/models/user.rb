class User < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "https://dl.dropboxusercontent.com/s/e6j5r5gbu0jpdsk/default.png", :storage => :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  has_many :listings, dependent: :destroy
  has_many :requests, class_name: "Edit", foreign_key: "requester_id"
  has_many :edits, class_name: "Edit", foreign_key: "editor_id"
end
