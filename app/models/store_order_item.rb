class StoreOrderItem < ActiveRecord::Base
  belongs_to :store_product
  belongs_to :store_order

  def set_price
    p = 0
    p = StoreProduct.find_by_id(self.store_product_id).price * quantity
    self.price = p
    price
  end
end
