 class AddDescriptionToStoreProducts < ActiveRecord::Migration
  def up
    add_column :store_products, :description, :string
  end

  def down
    remove_column :store_products, :description
  end
end
