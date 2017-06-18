json.extract! order_model, :id, :order_id, :model_id, :created_at, :updated_at
json.url order_model_url(order_model, format: :json)
