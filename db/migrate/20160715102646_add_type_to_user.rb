class AddTypeToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :user_type
    end
  end

  def self.down

  end
end
