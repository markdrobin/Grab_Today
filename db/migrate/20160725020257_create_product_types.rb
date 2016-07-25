class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :category

      t.timestamps null: false
    end
  end
end
