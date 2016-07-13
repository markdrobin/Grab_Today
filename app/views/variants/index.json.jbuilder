json.array!(@variants) do |variant|
  json.extract! variant, :id, :name, :value
  json.url variant_url(variant, format: :json)
end
