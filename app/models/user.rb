class User < ActiveRecord::Base
	if Rails.env.development?
    has_attached_file :avatar, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "https://dl.dropboxusercontent.com/s/e6j5r5gbu0jpdsk/default.png"
  else
    has_attached_file :avatar, :styles => { :medium => "200x", :thumb => "200x200>" }, :default_url => "https://dl.dropboxusercontent.com/s/e6j5r5gbu0jpdsk/default.png",
    :storage => :dropbox,
      :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, maximum: 32
  validates_exclusion_of :name, in: ['www', 'mail', 'ftp']
  has_many :listings, dependent: :destroy
  has_many :requests, class_name: "Edit", foreign_key: "requester_id"
  has_many :edits, class_name: "Edit", foreign_key: "editor_id"
  has_many :reviewsmade, class_name: "Review", foreign_key: "reviewee_id"
  has_many :reviewsgiven, class_name: "Review", foreign_key: "reviewer_id"
end
