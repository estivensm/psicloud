json.extract! tracing, :id, :admin_user, :user_id, :patient_id, :clinic_history_id, :description, :attachment, :tracing_type, :created_at, :updated_at
json.url tracing_url(tracing, format: :json)
