class CreateStoreOrderItems < ActiveRecord::Migration
  def change
    create_table :store_order_items do |t|
      t.decimal :price, precision: 8, scale: 2
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
