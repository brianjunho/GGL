class User < ActiveRecord::Base
	if Rails.env.development?
    has_attached_file :avatar, :styles => { :medium => "200x200", :thumb => "200x200>" }, :default_url => "https://dl.dropboxusercontent.com/s/dg0tkzo002cvsf1/Default.png"
  else
    has_attached_file :avatar, :styles => { :medium => "200x200", :thumb => "200x200>" }, :default_url => "https://dl.dropboxusercontent.com/s/dg0tkzo002cvsf1/Default.png", :storage => :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml"), :path => ":style/:id_:filename"
	end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :name
  validates :name, presence: true
  has_many :listings, dependent: :destroy
  has_many :requests, class_name: "Edit", foreign_key: "requester_id"
  has_many :edits, class_name: "Edit", foreign_key: "editor_id"
end
