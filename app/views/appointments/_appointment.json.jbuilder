json.extract! appointment, :id, :start_datetime, :end_datetime, :observations, :place, :patient_id, :admin_user, :user_id, :attachment, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
