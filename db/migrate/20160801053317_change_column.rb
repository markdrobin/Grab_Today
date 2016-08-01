class ChangeColumn < ActiveRecord::Migration
  def self.up
    change_column :store_products, :price, :decimal, precision: 16, scale: 2
  end

  def self.down
    change_column :store_products, :price
  end
end
