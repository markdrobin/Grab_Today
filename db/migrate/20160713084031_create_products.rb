class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :type
      t.string :brand
      t.string :manufacturer

      t.timestamps null: false
    end
  end
end
