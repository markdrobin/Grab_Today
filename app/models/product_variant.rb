class ProductVariant < ActiveRecord::Base
  belongs_to :store_product, dependent: :destroy
  belongs_to :variant, dependent: :destroy

  # def new(params)
  #   self = ProductVariant.create(params)
  # end

  def get_name
    variant.name
  end

  def get_value
    variant.value
  end

end



# attr_accessor :name, :value
# before_save :ensure_variant_existence
# after_initialize :set_product_variant_vars
#
# def get_name
#   variant.name
# end
#
# def get_value
#   variant.value
# end
#
# private
# def ensure_variant_existence
#   params = {name: name, value: value}
#   variants = Variant.where(params)
#   if !variants.empty?
#     self.variant_id = variants.first.id
#   else
#     self.variant_id = Variant.create(params).id
#   end
# end
#
# def set_product_variant_vars
#   if variant
#     self.name = get_name
#     self.value = get_value
#   end
# end

