json.extract! request_demo, :id, :app_id, :add_on_id, :contact_email, :contact_phone, :created_at, :updated_at
json.url request_demo_url(request_demo, format: :json)
