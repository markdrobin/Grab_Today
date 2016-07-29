class Variant < ActiveRecord::Base

  attr_accessor :variant_tokens
  after_save :ensure_value_duplicate, :ensure_variant

  def variant_tokens=(ids)
    self.variant_ids = ids.split(",")
  end

  def to_token
    values = []
    unless !value
      values = value.split(',')
    end
    values
  end

  def all_unique
    vars = []
    if !Variant.all
      vars
    else
      vars = Variant.all.order('name ASC')
      names = []
      vars.each do |v|
        names << v.name
      end
      names.uniq
    end
  end

  def to_token
    values = []
    unless !value
      values = value.split(',')
    end
    values
  end

  private
  def ensure_value_duplicate
    self.value = merge_values(value, '')
  end

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
    values1 = value1.split(',').map(&:strip)
    values2 = value2.split(',').map(&:strip)
    values = values1.uniq | values2.uniq
    merged_value = ''
    values.each do |v|
      merged_value << "#{v.capitalize}, "
    end
    merged_value.chomp(', ')
  end
end
