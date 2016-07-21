class StoreProduct < ActiveRecord::Base
  belongs_to :store
  belongs_to :product
  has_many :variants, :through => :product_variants

  attr_accessor :name, :product_type, :brand, :manufacturer, :description, :avatar

  before_save :ensure_product_existence

  def get_name
    product.name
  end

  def get_type
    product.product_type
  end

  def get_brand
    product.brand
  end

  def get_manufacturer
    product.manufacturer
  end

  def get_description
    product.description
  end

  def get_avatar
    product.avatar
  end

  private
  def ensure_product_existence
    params = {name: name, product_type: product_type, brand: brand, manufacturer: manufacturer, description: description   }
    products = Product.where(params)
    if !products.empty?
      self.product_id = products.first.id
    else
      params[:avatar] = avatar
      self.product_id = Product.create(params).id
  end
  end
end
