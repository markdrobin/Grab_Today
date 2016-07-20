class User < ActiveRecord::Base
  has_many :stores
  accepts_nested_attributes_for :stores
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def get_stores
      stores
  end

end
