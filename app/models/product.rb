class Product < ActiveRecord::Base
  has_many :store_products, dependent: :destroy
  has_many :stores, :through => :store_products
  has_attached_file :avatar, default_url: "/assets/product.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
