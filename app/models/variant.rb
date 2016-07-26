class Variant < ActiveRecord::Base
  has_many :product_variants, dependent: :destroy
  has_many :store_products, :through => :product_variants, dependent: :destroy
end
