class Variant < ActiveRecord::Base
  after_save :ensure_variant

  def to_token
    values = []
    unless !value
      values = value.split(',')
    end
    values
  end

  private
  def ensure_variant
    params = {name: name, store_product_id: store_product_id}
    variants = Variant.where(params)
    unless variants.length == 0
      v = variants.first
      unless v.store_product_id != store_product_id
        unless v.value == value
          new_value = merge_values(v.value, value)
          v.update({value: new_value})
          self.destroy unless v.id == id
        end
      end
    end
  end

  def merge_values(value1, value2)
    #.lstrip
    values1 = value1.split(',').map(&:strip)
    values2 = value2.split(',').map(&:strip)
    values = values1 | values2
    merged_value = ''
    values.each do |v|
      merged_value << "#{v.capitalize}, "
    end
    merged_value.chomp(', ')
  end
end
