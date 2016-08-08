class AddQrPathColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :qr_path, :string
  end
end
