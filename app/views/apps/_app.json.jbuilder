json.extract! app, :id, :app_code, :token, :secret, :name, :created_at, :updated_at
json.url app_url(app, format: :json)
