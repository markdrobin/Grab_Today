class AddDeletedAtToStores < ActiveRecord::Migration
  def up
    add_column :stores, :deleted_at, :datetime
    add_index :stores, :deleted_at
  end

  def down
    remove_column :stores, :deleted_at
    remove_index :stores, :deleted_at
  end
end
