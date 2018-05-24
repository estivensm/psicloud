json.extract! task, :id, :user_id, :admin_user, :patient_id, :description, :fecha_compromiso, :appointment_id, :estado, :fecha_entrega, :cumplimiento, :file, :created_at, :updated_at
json.url task_url(task, format: :json)
