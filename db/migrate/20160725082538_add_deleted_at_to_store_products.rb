class AddDeletedAtToStoreProducts < ActiveRecord::Migration
  def up
    add_column :store_products, :deleted_at, :datetime
    add_index :store_products, :deleted_at
  end

  def down
    remove_column :store_products, :deleted_at
    remove_index :store_products, :deleted_at
  end
end
