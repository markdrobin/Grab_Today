class CreateStoreOrders < ActiveRecord::Migration
  def change
    create_table :store_orders do |t|
      t.decimal :total_cost, precision: 5, scale: 2
      t.integer :status

      t.timestamps null: false
    end
  end
end
