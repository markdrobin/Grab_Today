class AddRefsToStoreOrders < ActiveRecord::Migration
  def change
    add_reference :store_orders, :store, index: true, foreign_key: true
    add_reference :store_orders, :order, index: true, foreign_key: true
  end
end
