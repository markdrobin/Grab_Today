class AddReferenceToStores < ActiveRecord::Migration
  def up
    add_reference :stores, :user, index: true, foreign_key: true
  end

  def down
    remove_refence :stores, :user
  end
end
