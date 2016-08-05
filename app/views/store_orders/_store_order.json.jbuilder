json.extract! store_order, :id, :total_cost, :status, :created_at, :updated_at
json.url store_order_url(store_order, format: :json)