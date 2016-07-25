class AddAttachmentAvatarToStoreProducts < ActiveRecord::Migration
  def self.up
    change_table :store_products do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :store_products, :avatar
  end
end
