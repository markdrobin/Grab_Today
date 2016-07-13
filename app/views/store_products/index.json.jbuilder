json.array!(@store_products) do |store_product|
  json.extract! store_product, :id, :price, :stock
  json.url store_product_url(store_product, format: :json)
end
