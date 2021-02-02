json.extract! subscription, :id, :app_id, :add_on_id, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
