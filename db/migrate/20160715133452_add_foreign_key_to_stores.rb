class AddForeignKeyToStores < ActiveRecord::Migration
  def self.up
    change_table :stores do |t|
      t.belongs_to :user, index: true
    end
  end
  def self.down

  end
end
