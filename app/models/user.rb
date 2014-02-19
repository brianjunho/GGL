class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  has_many :listings, dependent: :destroy
  has_many :requests, class_name: "Edit", foreign_key: "requester_id"
  has_many :edits, class_name: "Edit", foreign_key: "editor_id"
end
