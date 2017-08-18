json.extract! patient, :id, :first_name, :second_name, :first_last_name, :second_last_name, :birth_date, :age, :document_type, :document, :occupation, :profession, :phone, :address, :email, :contact_name, :contact_phone, :created_at, :updated_at
json.url patient_url(patient, format: :json)
