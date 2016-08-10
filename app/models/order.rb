class Order < ActiveRecord::Base
  belongs_to :user
  has_many :store_orders
  accepts_nested_attributes_for :store_orders

end
