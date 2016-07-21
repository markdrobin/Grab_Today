class ProductVariant < ActiveRecord::Base
  belongs_to :store_product
  belongs_to :variant

  attr_accessor :name, :value

  before_save :ensure_variant_existence

  def get_name
    variant.name
  end

  def get_value
    variant.value
  end

  private
  def ensure_variant_existence
    params = {name: name, value: value}
    variants = Variant.where(params)
    if !variants.empty?
      self.variant_id = variants.first.id
    else
      self.variant_id = Variant.create(params).id
    end
  end

end
