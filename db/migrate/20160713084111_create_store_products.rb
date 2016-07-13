class CreateStoreProducts < ActiveRecord::Migration
  def change
    create_table :store_products do |t|
      t.decimal :price
      t.integer :stock

      t.timestamps null: false
    end
  end
end
