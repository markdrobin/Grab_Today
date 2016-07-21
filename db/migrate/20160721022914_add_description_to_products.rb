class AddDescriptionToProducts < ActiveRecord::Migration
  def up
    add_column :products, :description, :string
  end

  def down
    remove_column :products, :description
  end
end
