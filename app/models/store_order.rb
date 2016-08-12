class StoreOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :store
  has_many :store_order_items
  has_many :store_products, through: :store_order_items
  accepts_nested_attributes_for :store_order_items
  accepts_nested_attributes_for :store_products

  def set_total_cost
    t_cost = 0
    items = StoreOrderItem.where(store_order_id: id)
    if items
      items.each do |item|
        t_cost += item.set_price
      end
    end
    self.total_cost = t_cost
    total_cost
  end
end
