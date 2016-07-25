class AddQrcodePathColumnToStoreProducts < ActiveRecord::Migration
  def up
    add_column :store_products, :qr_code_path, :string
  end

  def down
    remove_column :store_products, :qr_code_path
  end
end
