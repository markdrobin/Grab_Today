class Picture < ActiveRecord::Base
  belongs_to :store_product

  has_attached_file :image, default_url: "/assets/product.jpg"
  do_not_validate_attachment_file_type :image
end
