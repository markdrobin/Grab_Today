class ChangeStoreHourColumnsInStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :opening_time, :string
    add_column :stores, :closing_time, :string
    remove_column :stores, :store_hours
  end

  def self.dowm

  end
end
