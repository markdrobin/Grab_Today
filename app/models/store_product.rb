class StoreProduct < ActiveRecord::Base
  belongs_to :store
  belongs_to :product
  has_many :product_variants, dependent: :destroy
  has_many :variants, :through => :product_variants
  accepts_nested_attributes_for :variants
  accepts_nested_attributes_for :product_variants

  attr_accessor :name, :product_type, :brand, :manufacturer, :description, :avatar, :name, :value
  before_save :ensure_product_existence, :ensure_variant_existence
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

  def ensure_variant_existence
    print 'TRACE ' + product.name + ' ' + product.brand + ' ' + product_variants[0].to_s + ' END'
    v_params = {name: name, value: value}
    variants = Variant.where(v_params)
    # prod_variant = ProductVariant.new
    # if !variants.empty?
    #   product_variants.build_variant(variants.first)
    #   # prod_variant.variant_id = variants.first.id
    # else
    #   product_variants.build_variant(Variant.create(v_params))
    #   # prod_variant.variant_id = Variant.create(v_params).id
    # end
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
