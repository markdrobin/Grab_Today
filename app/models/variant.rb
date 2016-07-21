class Variant < ActiveRecord::Base
  has_many :store_products, :through => :product_variants
end
