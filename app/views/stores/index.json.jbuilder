json.array!(@stores) do |store|
  json.extract! store, :id, :name, :contact, :location, :category, :store_hours, :average_sales, :description, :website, :facebook_page, :twitter_page
  json.url store_url(store, format: :json)
end
