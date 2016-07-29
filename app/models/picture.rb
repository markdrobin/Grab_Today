class Picture < ActiveRecord::Base
  belongs_to :store_product

  has_attached_file :image, default_url: "/assets/product.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
