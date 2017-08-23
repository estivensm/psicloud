json.extract! clinic_history, :id, :clinic_history_id, :count, :consultation_reason, :actual_state, :diagnostic_hypothesis, :therapeutic_goal, :quantity_appointment, :frequency_appointment, :user_id, :admin_user, :patient_id, :type_of_treatment, :description_appointment, :created_at, :updated_at
json.url clinic_history_url(clinic_history, format: :json)
