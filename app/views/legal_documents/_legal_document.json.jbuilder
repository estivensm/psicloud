json.extract! legal_document, :id, :name, :description, :type_document, :user_id, :admin_user, :clinic_history_id, :patient_id, :created_at, :updated_at
json.url legal_document_url(legal_document, format: :json)
