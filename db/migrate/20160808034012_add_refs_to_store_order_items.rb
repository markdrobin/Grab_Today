class AddRefsToStoreOrderItems < ActiveRecord::Migration
  def change
    add_reference :store_order_items, :store_order, index: true, foreign_key: true
    add_reference :store_order_items, :store_product, index: true, foreign_key: true
  end
end
