class ProductType < ActiveRecord::Base

  def all_unique
    product_types = []
    if !ProductType.all
      product_types
    else
      product_types = ProductType.all.order('category ASC')
      categories = []
      product_types.each do |p|
        categories << p.category
      end
      categories.uniq
    end
  end
end
