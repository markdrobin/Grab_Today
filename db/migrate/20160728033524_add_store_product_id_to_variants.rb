class AddStoreProductIdToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :store_product_id, :integer
  end
end
