class Product < ActiveRecord::Base
  acts_as_paranoid
  has_many :store_products, dependent: :destroy
  has_many :stores, :through => :store_products


end
