class StoreProduct < ActiveRecord::Base
  include PublicActivity::Model
  acts_as_paranoid

  belongs_to :store
  belongs_to :product
  has_many :product_variants, dependent: :destroy
  has_many :variants, :through => :product_variants
  accepts_nested_attributes_for :variants, allow_destroy: true
  accepts_nested_attributes_for :product_variants

  attr_accessor :name, :product_type, :brand, :manufacturer
  before_save :ensure_product_existence#, :ensure_variant_existence
  after_save :remove_blank_variants
  after_create :save_qr_code_path
  after_initialize :set_product_vars

  has_attached_file :avatar, default_url: "/assets/product.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

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
    if stock.eql?(nil)
      update stock: additional_stocks.to_i
    else
      update stock: stock + additional_stocks.to_i
    end

  end

  def save_qr_code_path
    self.qr_code_path = "store_products/#{id}"
    save
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

  def ensure_variant_existence
    # product_variants.
    # prod_variants = []
    # variants.each do |v|
    #   # print "WAAAAAAAAAAAAAIIIIIIIIIIIIIIIITTTTTTTTTT #{v.name} ENDDDDD"
    #   v_params = {name: v.name, value: v.value}
    #   variants = Variant.where(v_params)
    #   prod_variant = ProductVariant.new
    #   if variants.empty?
    #     # product_variants.build_variant(Variant.create(v_params))
    #     prod_variant.variant_id = Variant.create(v_params).id
    #   else
    #     # product_variants.build_variant(variants.first)
    #     prod_variant.variant_id = variants.first.id
    #   end
    #   prod_variants.insert(prod_variant)
    # end
    #
    variants.each do |v|
      print "\n##### #{v[:id]} :: #{v[:name]} :: #{v[:value]} #####\n"
      v_params = {id: v[:id], name: v[:name], value: v[:value]}
      variant = Variant.where({id: v[:id]})
      if !variant.empty?
        # self.product_id = products.first.id
        print "\n----NOT EMPTY---- #{v[:name]} :: #{v[:value]}\n"
        # variant.update(v_params)
      else
        print "\n----EMPTY---- #{v[:name]} :: #{v[:value]}\n"
        # new_prod_var = ProductVariant.create({store_product_id: self.id, variant_id: Variant.create({name: v[:name], value: v[:value]}).id})
        # product_variants.push(new_var.id)
        # self.variants
        # self.product_id = Product.create(params).id
      end
    end

    # if prod_variants.empty?
    #   self.product_variants = nil
    # else
    #   self.product_variants = prod_variants
    # end

    # v_params = {name: name, value: value}
    # variants = Variant.where(v_params)
    # prod_variant = ProductVariant.new
    # if !variants.empty?
    #   product_variants.build_variant(variants.first)
    #   prod_variant.variant_id = variants.first.id
    # else
    #   product_variants.build_variant(Variant.create(v_params))
    #   prod_variant.variant_id = Variant.create(v_params).id
    # end

    # pv.delete unless pv[:name].present?
    # product_variants.each do |pv|
    #   print "WAAAAAAAAAAAAAIIIIIIIIIIIIIIIITTTTTTTTTT #{pv[:name[0]].to_s} ENDDDDD"
    #   pv.name.each do |n|
    #     print " YES :: #{n} \n"
    #   end
    # end
  end

  def remove_blank_variants
    product_variants.each do |pv|
      if pv.variant[:name.to_s] == '' || pv.variant[:value.to_s] == ''
        pv.delete
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
