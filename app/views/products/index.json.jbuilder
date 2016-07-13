json.array!(@products) do |product|
  json.extract! product, :id, :name, :type, :brand, :manufacturer
  json.url product_url(product, format: :json)
end
