class AddRefsToProductVariants < ActiveRecord::Migration
  def change
    add_reference :product_variants, :store_product, index: true, foreign_key: true
    add_reference :product_variants, :variant, index: true, foreign_key: true
  end
end
