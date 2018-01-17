json.extract! document, :id, :name, :file, :description, :state, :user_id, :admin_user, :created_at, :updated_at
json.url document_url(document, format: :json)
