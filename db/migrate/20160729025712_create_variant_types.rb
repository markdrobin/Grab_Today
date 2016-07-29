class CreateVariantTypes < ActiveRecord::Migration
  def self.up
    create_table :variant_types do |t|
      t.string :name
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :variant_types
  end
end
