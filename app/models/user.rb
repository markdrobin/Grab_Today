class User < ActiveRecord::Base
  has_many :stores
  accepts_nested_attributes_for :stores
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar, default_url: "/assets/default_pp.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
