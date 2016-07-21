class ProductVariant < ActiveRecord::Base
  belongs_to :store_product
  belongs_to :variant
end
