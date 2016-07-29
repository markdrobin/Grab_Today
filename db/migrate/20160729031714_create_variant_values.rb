class CreateVariantValues < ActiveRecord::Migration
  def self.up
    create_table :variant_values do |t|
      t.string :value
      t.timestamps null: false
    end

    add_reference :variant_values, :variant_type, index: true, foreign_key: true
  end

  def self.down
    remove_refence :variant_values, :variant_type
    drop_table :variant_values
  end
end
