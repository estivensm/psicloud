json.extract! account, :id, :name, :address, :phone, :email, :logo, :admin_user, :users_quantity, :file_size, :account_type, :created_at, :updated_at
json.url account_url(account, format: :json)
