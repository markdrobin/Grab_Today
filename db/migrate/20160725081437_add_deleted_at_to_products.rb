class AddDeletedAtToProducts < ActiveRecord::Migration
  def up
    add_column :products, :deleted_at, :datetime
    add_index :products, :deleted_at
  end

  def down
    remove_column :products, :deleted_at
    remove_index :products, :deleted_at
  end
end
