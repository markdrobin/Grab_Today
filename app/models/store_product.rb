class StoreProduct < ActiveRecord::Base
  belongs_to :store
  belongs_to :product
  has_many :product_variants
  has_many :variants, :through => :product_variants

  attr_accessor :name, :product_type, :brand, :manufacturer, :description, :avatar
  before_save :ensure_product_existence
  after_initialize :set_product_vars

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

  def get_variants
    variants
  end

  def get_description
    product.description
  end

  def get_avatar
    product.avatar
  end

  private
  def ensure_product_existence
    params = {name: name, product_type: product_type, brand: brand, manufacturer: manufacturer, description: description}
    if product_id
      self.product.update(params)
    else
      products = Product.where(params)
      if !products.empty?
        self.product_id = products.first.id
      else
        self.product_id = Product.create(params).id
      end
    end
  end

  def set_product_vars
    if product
      self.name = get_name
      self.product_type = get_type
      self.brand = get_brand
      self.manufacturer = get_manufacturer
    end
  end

end
