class StoreOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :store
  has_many :store_order_items
  has_many :store_products, through: :store_order_items
  accepts_nested_attributes_for :store_order_items
  accepts_nested_attributes_for :store_products

end
