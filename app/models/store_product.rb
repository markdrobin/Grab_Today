class StoreProduct < ActiveRecord::Base
  include PublicActivity::Model
  acts_as_paranoid

  belongs_to :store
  belongs_to :product
  has_many :variants, dependent: :destroy
  accepts_nested_attributes_for :variants, allow_destroy: true

  attr_accessor :name, :product_type, :brand, :manufacturer, :variant_tokens, :variant_category
  attr_reader :variant_tokens, :variant_category

  before_save :ensure_product_existence, :valid?
  after_save :ensure_category_existence, :remove_blank_variants
  after_create :save_qr_code_path
  after_initialize :set_product_vars
  validate :check_product_duplicate

  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  def variant_tokens=(value)
    # self.variant_ids = ids.split(",")
    ids = []
    value.split(',').each do |val|
      if val[0..4] == '-new-'
        fav = Variant.create!(:name => params[:variant_category], :value => val.gsub(/-new-/, ''))
        ids += [fav.id]
      else
        ids += [val.to_i]
      end
    end
    # var_ids = self.favorites.for_type('brands').map(&:id)
    # self.favorite_ids = self.favorite_ids - brand_ids + ids
  end

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

  def restock(additional_stocks)
    if stock.nil?
      update stock: additional_stocks.to_i
    else
      update stock: stock + additional_stocks.to_i
    end
  end

  def save_qr_code_path
    self.qr_code_path = "store_products/#{id}"
    save
  end

  def is_not_unique?
    if self.new_record?
      if StoreProduct.exists?({:product_id => product_id, :store_id => store_id})
        errors.add(:product, "already taken in this store.")
      end
    else
      store.store_products.each do |sp|
        if sp.id != self.id
          if self.name == sp.name && self.product_type == sp.product_type && self.brand == sp.brand && self.manufacturer == sp.manufacturer
            errors.add(:product, "already taken in this store.")
          end
        end
      end
    end
  end

  def delete_product
    if product.store_products.count > 1
      self.destroy
    else
      product.destroy
    end
  end

  def check_product_duplicate
    print "############## start ##############"
    if !self.is_not_unique?
      print "############### in #############"
      StoreProduct.all.each do |p|
        if p.id != self.id
          if self.name == p.name && self.product_type == p.product_type && self.brand == p.brand && self.manufacturer == p.manufacturer
            print "############### hello #{p.name} ###############"
          end
        end
      end
    end
  end

  private

  def ensure_product_existence
    params = {name: name, product_type: product_type, brand: brand, manufacturer: manufacturer}
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

  def ensure_category_existence
    categories = ProductType.where({category: product_type})
    ProductType.create({category: product_type}) if categories.empty?
  end

  def remove_blank_variants
    variants.each do |v|
      if v[:name.to_s] == '' #|| v[:value.to_s] == ''
        v.delete
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
