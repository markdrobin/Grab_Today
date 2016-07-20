class AddRefsToStoreProduct < ActiveRecord::Migration
  def change
    add_reference :store_products, :store, index: true, foreign_key: true
    add_reference :store_products, :product, index: true, foreign_key: true
  end
end
