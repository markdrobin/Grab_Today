class Variant < ActiveRecord::Base

  after_save :ensure_value_existence, :ensure_category_existence

  def ensure_category_existence
    types = VariantType.where({name: name})
    if types.length != 0
      new_type = VariantType.create({name: name})
      current = self.value.split(",")
      current.each do |val|
        VariantValue.create({value: val, variant_type_id: new_type.id})
      end
    end
  end

  def ensure_value_existence
    types = VariantType.where({name: name})
    if types.length != 0
      values = VariantValue.where({variant_type_id: types.first.id})
      current = self.value.split(",")
      vals = []
      values.each do |v|
        vals << v.value
      end
      current.each do |val|
        if !vals.include? val
          VariantValue.create({value: val, variant_type_id: types.first.id})
        end
      end
    else
      new_type = VariantType.create({name: name})
      current = self.value.split(",")
      current.each do |val|
        VariantValue.create({value: val, variant_type_id: new_type.id})
      end
    end
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
