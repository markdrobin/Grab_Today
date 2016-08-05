class StoreOrderItem < ActiveRecord::Base
  belongs_to :store_product
  belongs_to :store_order

end
