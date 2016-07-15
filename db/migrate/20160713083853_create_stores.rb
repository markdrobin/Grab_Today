class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :contact
      t.string :location
      t.string :category
      t.string :store_hours
      t.decimal :average_sales
      t.string :description
      t.string :website
      t.string :facebook_page
      t.string :twitter_page

      t.timestamps null: false
    end
  end
end