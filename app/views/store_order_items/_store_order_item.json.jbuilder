json.extract! store_order_item, :id, :price, :quantity, :created_at, :updated_at
json.url store_order_item_url(store_order_item, format: :json)