# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190121212226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string "name"
    t.integer "users"
    t.integer "file_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "logo"
    t.integer "admin_user"
    t.integer "users_quantity"
    t.integer "file_size"
    t.string "account_type"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nit"
    t.integer "file_size_add"
    t.integer "users_quantity_add"
    t.integer "file_size_now"
    t.integer "users_quantity_now"
    t.integer "account_type_id"
  end

  create_table "agreements", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "percent"
    t.integer "user_id"
    t.integer "admin_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.text "observations"
    t.string "place"
    t.integer "patient_id"
    t.integer "admin_user"
    t.integer "user_id"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.string "name"
    t.string "google_event_id"
    t.string "state"
    t.text "reason_cancel"
  end

  create_table "backgrounds", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "patient_id"
    t.integer "clinic_history_id"
    t.text "description"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_background"
    t.string "clase"
  end

  create_table "child_brothers", force: :cascade do |t|
    t.string "name"
    t.string "sexo"
    t.string "edad"
    t.string "birthdate"
    t.string "relationship"
    t.string "observations"
    t.integer "child_general_date_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "child_general_dates", force: :cascade do |t|
    t.string "father_name"
    t.integer "father_age"
    t.date "father_birthday"
    t.string "father_job"
    t.string "father_addictions"
    t.string "father_relationship"
    t.string "mother_name"
    t.integer "mother_age"
    t.string "mother_job"
    t.string "parents_realationship"
    t.string "reasons_relationship"
    t.string "parents_reaction"
    t.integer "patient_id"
    t.integer "admin_user"
    t.integer "user_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mother_addictions"
    t.string "mother_relationship"
    t.date "mother_birthday"
    t.integer "clinic_history_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.string "genero"
    t.integer "age"
    t.string "relationship"
    t.text "observations"
    t.integer "child_general_date_id"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clinic_histories", force: :cascade do |t|
    t.integer "clinic_history_id"
    t.integer "count"
    t.text "consultation_reason"
    t.text "actual_state"
    t.text "diagnostic_hypothesis"
    t.text "therapeutic_goal"
    t.integer "quantity_appointment"
    t.string "frequency_appointment"
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "patient_id"
    t.text "type_of_treatment"
    t.text "description_appointment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "family_dinamic"
    t.boolean "child_history"
    t.string "codigo"
    t.datetime "created_date"
    t.boolean "first_contact_state"
    t.boolean "outcome_state"
    t.integer "consult_reason_id"
    t.boolean "first_child_state"
    t.boolean "second_child_state"
    t.boolean "third_child_state"
    t.boolean "four_child_state"
    t.boolean "desenlace_first"
    t.datetime "desenlace_created_at"
    t.boolean "first_child_first"
    t.datetime "child_first_created_at"
    t.boolean "first_child_second"
    t.datetime "second_child_created_at"
    t.boolean "first_child_third"
    t.datetime "third_child_created_at"
    t.boolean "first_child_four"
    t.datetime "four_child_created_at"
    t.integer "diagnostico_id"
    t.datetime "first_contact_created_at"
  end

  create_table "clinic_histories_diagnosticos", id: false, force: :cascade do |t|
    t.bigint "clinic_history_id"
    t.bigint "diagnostico_id"
    t.index ["clinic_history_id"], name: "index_clinic_histories_diagnosticos_on_clinic_history_id"
    t.index ["diagnostico_id"], name: "index_clinic_histories_diagnosticos_on_diagnostico_id"
  end

  create_table "clinic_histories_diagnostics", id: false, force: :cascade do |t|
    t.bigint "clinic_history_id"
    t.bigint "diagnostic_id"
    t.index ["clinic_history_id"], name: "index_clinic_histories_diagnostics_on_clinic_history_id"
    t.index ["diagnostic_id"], name: "index_clinic_histories_diagnostics_on_diagnostic_id"
  end

  create_table "clinic_histories_first_diagnosticos", force: :cascade do |t|
    t.bigint "clinic_history_id"
    t.bigint "first_diagnostico_id"
    t.index ["clinic_history_id"], name: "clinic_history"
    t.index ["first_diagnostico_id"], name: "first_diagnostico"
  end

  create_table "clinic_history_couple_outcomes", force: :cascade do |t|
    t.integer "clinic_history_family_id"
    t.integer "clinic_history_couple_id"
    t.text "diagnostic_description"
    t.text "therapeutic_goal"
    t.text "type_of_treatment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clinic_history_couple_outcomes_diagnostics", id: false, force: :cascade do |t|
    t.bigint "clinic_history_couple_outcome_id", null: false
    t.bigint "diagnostic_id", null: false
  end

  create_table "clinic_history_couple_outcomes_first_diagnosticos", id: false, force: :cascade do |t|
    t.bigint "clinic_history_couple_outcome_id", null: false
    t.bigint "first_diagnostico_id", null: false
  end

  create_table "clinic_history_couples", force: :cascade do |t|
    t.integer "couple_patient_id"
    t.integer "previous_unions_patient"
    t.integer "previous_unions_couple"
    t.integer "previous_children_patient"
    t.integer "previous_children_couple"
    t.text "problematic_conduct_patient"
    t.text "problematic_conduct_couple"
    t.text "consultation_reason"
    t.text "general_observations"
    t.text "actual_situations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
  end

  create_table "clinic_history_families", force: :cascade do |t|
    t.text "reason_consultation"
    t.text "antecedent_problem"
    t.text "family_problem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clinic_history_families_patients", id: false, force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "clinic_history_family_id", null: false
  end

  create_table "clinichistory_configs", force: :cascade do |t|
    t.string "header_image"
    t.string "footer_image"
    t.text "header_text"
    t.text "footer_text"
    t.string "state"
    t.integer "admin_user"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consents", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "account_id"
    t.text "body"
    t.string "title"
    t.integer "first_age"
    t.integer "second_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "header"
    t.text "footer"
    t.boolean "state"
  end

  create_table "consult_reasons", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.string "name"
    t.text "description"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "subjet"
    t.string "email"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "created_formats", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.integer "admin_user"
    t.text "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crete_fields", force: :cascade do |t|
    t.integer "admin_user"
    t.integer "user_id"
    t.text "content"
    t.integer "clinic_history_id"
    t.integer "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "check_box_field"
    t.string "text_field"
    t.string "select_field"
    t.integer "tracing_id"
    t.integer "child_general_date_id"
  end

  create_table "diagnostic_helps", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "type_document"
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "clinic_history_id"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnosticos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "admin_user"
    t.integer "user_id"
    t.integer "count"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnostics", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "admin_user"
    t.integer "user_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_couple_families", force: :cascade do |t|
    t.string "tool_type"
    t.text "descripcion"
    t.string "document_type"
    t.string "name"
    t.integer "clinic_history_couple_id"
    t.integer "clinic_history_family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_families", force: :cascade do |t|
    t.string "tool_type"
    t.text "descripcion"
    t.string "document_type"
    t.string "name"
    t.string "string"
    t.integer "clinic_history_family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "file"
    t.text "description"
    t.boolean "state"
    t.integer "user_id"
    t.integer "admin_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "family_groups", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.integer "document_number"
    t.integer "age"
    t.string "sex"
    t.string "civil_status"
    t.string "occupation"
    t.string "relationship"
    t.integer "clinic_history_family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "field_defaults", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "account_id"
    t.boolean "observation_tracing_state"
    t.boolean "evolution_tracing_state"
    t.boolean "description_tracing_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.string "type_field"
    t.boolean "state"
    t.integer "user_id"
    t.integer "admin_user"
    t.boolean "requierd"
    t.string "form"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fieldselects", force: :cascade do |t|
    t.integer "field_id"
    t.integer "admin_user"
    t.integer "user_id"
    t.string "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "first_diagnosticos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "admin_user"
    t.integer "user_id"
    t.integer "count"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "first_rips", force: :cascade do |t|
    t.string "tipo_identificacion"
    t.string "numero_identificacion"
    t.string "codigo_entidad_admin"
    t.string "tipo_usuario"
    t.string "primer_apellido"
    t.string "segundo_apellido"
    t.string "primer_nombre"
    t.string "segundo_nombre"
    t.string "edad"
    t.string "unidad_medida_edad"
    t.string "sexo"
    t.string "codigo_dpto"
    t.string "codigo_municipio"
    t.string "zona_residencial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "general_files", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.string "file"
    t.string "name"
    t.integer "tool_test_id"
    t.integer "tracing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "document_id"
    t.integer "personal_background_id"
    t.integer "background_id"
    t.integer "diagnostic_help_id"
    t.integer "legal_document_id"
    t.integer "tracing_couple_family_id"
    t.integer "document_couple_family_id"
    t.integer "tracing_family_id"
    t.integer "document_family_id"
  end

  create_table "hpcs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id"
    t.integer "admin_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legal_documents", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "type_document"
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "clinic_history_id"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outcome_families", force: :cascade do |t|
    t.integer "clinic_history_family_id"
    t.text "diagnostic_description"
    t.text "therapeutic_goal"
    t.text "type_of_treatment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "first_last_name"
    t.string "second_last_name"
    t.date "birth_date"
    t.integer "age"
    t.string "document_type"
    t.string "document"
    t.string "occupation"
    t.string "profession"
    t.string "phone"
    t.string "address"
    t.string "email"
    t.string "contact_name"
    t.string "contact_phone"
    t.string "contact_relationship"
    t.string "gender"
    t.string "civil_status"
    t.string "blood_type"
    t.string "ethnic_group"
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "count"
    t.integer "agreement_id"
    t.string "avatar"
    t.string "movil"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
    t.integer "hpc_id"
    t.integer "birthdate_month"
    t.integer "birthdate_day"
    t.string "school_grade"
    t.boolean "state"
    t.text "firma_paciente"
    t.text "firma_psicologo"
    t.text "firma_madre"
    t.text "firma_padre"
    t.string "children"
    t.integer "number_children"
  end

  create_table "personal_backgrounds", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "patient_id"
    t.integer "clinic_history_id"
    t.string "attachement"
    t.string "description"
    t.string "type_background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_histories", force: :cascade do |t|
    t.string "embarazo"
    t.string "hijo_deseado"
    t.text "dificultades_prenatales"
    t.string "periodo_prenatal"
    t.string "parto"
    t.float "peso_nacimiento"
    t.float "talla_nacimiento"
    t.integer "latencia_materna"
    t.integer "biberon"
    t.string "semisolidos"
    t.string "solidos"
    t.string "problemas_alimentacion"
    t.string "dificultad_dormir"
    t.string "reacciones"
    t.integer "edad_gateo"
    t.integer "edad_pie"
    t.integer "edad_caminar"
    t.integer "inicio_lenguaje"
    t.string "enfermedades_medicas"
    t.string "hospitalizacion_cirugias"
    t.string "problemas_visoperceptivomotores"
    t.integer "accout_id"
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "patient_id"
    t.integer "clinic_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rols", force: :cascade do |t|
    t.boolean "show_user"
    t.boolean "create_user"
    t.boolean "edit_user"
    t.boolean "delete_user"
    t.boolean "show_patient"
    t.boolean "create_patient"
    t.boolean "edit_patient"
    t.boolean "delete_patient"
    t.boolean "show_hc"
    t.boolean "create_hc"
    t.boolean "edit_hc"
    t.boolean "delete_hc"
    t.boolean "show_cita"
    t.boolean "create_cita"
    t.boolean "edit_cita"
    t.boolean "delete_cita"
    t.boolean "show_doc"
    t.boolean "create_doc"
    t.boolean "edit_doc"
    t.boolean "delete_doc"
    t.boolean "show_rol"
    t.boolean "create_rol"
    t.boolean "edit_rol"
    t.boolean "delete_rol"
    t.boolean "configuracion"
    t.integer "admin_user"
    t.integer "user_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default"
    t.boolean "show_all_user"
    t.boolean "show_all_patient"
    t.boolean "show_all_hc"
    t.boolean "show_all_cita"
    t.boolean "show_all_doc"
    t.boolean "show_all_rol"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "patient_id"
    t.text "description"
    t.date "fecha_compromiso"
    t.integer "appointment_id"
    t.boolean "estado"
    t.date "fecha_entrega"
    t.boolean "cumplimiento"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "three_child_histories", force: :cascade do |t|
    t.string "destete"
    t.string "gustos_alimentos"
    t.string "dejado_alimentacion"
    t.string "tipo_alimentacion"
    t.string "reaccion_defecacion"
    t.string "succion_dedo"
    t.string "masturbacion"
    t.string "duerme_con"
    t.string "visto_acto_sexual"
    t.string "conocimientos_sexualidad"
    t.string "informacion_sexual"
    t.integer "menarquia"
    t.string "experiencia_menarquia"
    t.integer "polucion"
    t.string "experiencia_polucion"
    t.string "fue_informado"
    t.string "reacciones_emocionales"
    t.string "noviazgo"
    t.string "aceptacion_noviazgo"
    t.string "sintomas_neuroticos"
    t.string "descripcion_sintomas"
    t.string "responsable_disiplina"
    t.string "comportamientos_molestos"
    t.string "tipos_de_castigo"
    t.string "observaciones"
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "patient_id"
    t.integer "clinic_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tool_tests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user"
    t.integer "patient_id"
    t.integer "clinic_history_id"
    t.string "type_tool"
    t.text "description"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracing_couple_families", force: :cascade do |t|
    t.integer "clinic_history_couple_id"
    t.integer "clinic_history_family_id"
    t.integer "admin_user"
    t.integer "user_id"
    t.text "description"
    t.string "attachment"
    t.string "tracing_type"
    t.date "tracing_date"
    t.text "observation"
    t.text "evolution"
    t.boolean "tracing_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracing_families", force: :cascade do |t|
    t.integer "clinic_history_family_id"
    t.integer "admin_user"
    t.integer "user_id"
    t.text "description"
    t.string "attachment"
    t.string "tracing_type"
    t.date "tracing_date"
    t.text "observation"
    t.text "evolution"
    t.boolean "tracing_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracings", force: :cascade do |t|
    t.integer "admin_user"
    t.integer "user_id"
    t.integer "patient_id"
    t.integer "clinic_history_id"
    t.text "description"
    t.string "attachment"
    t.string "tracing_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "tracing_date"
    t.text "observation"
    t.text "evolution"
    t.boolean "tracing_state"
    t.datetime "tracing_created_at"
    t.integer "clinic_history_couple_id"
    t.boolean "state"
  end

  create_table "two_child_histories", force: :cascade do |t|
    t.string "nivel_escolar"
    t.string "indice_academico"
    t.string "escuela"
    t.string "adaptacion_escolar"
    t.string "problemas_escolares"
    t.string "gustos_escolares"
    t.string "disgustos_escolares"
    t.string "tareas"
    t.string "utiles_escolares"
    t.string "problemas_materias"
    t.string "relacion_maestro"
    t.string "relacion_companeros"
    t.string "frecuencia_amigos"
    t.string "edad_amigos"
    t.string "tipo_juegos"
    t.string "actividades_mismo_sexo"
    t.string "actividades_otro_sexo"
    t.string "pelea"
    t.string "motivo_felicidad"
    t.string "motivo_tristeza"
    t.string "motivo_enojo"
    t.string "motivos_pregunta"
    t.string "habitos"
    t.integer "admin_user"
    t.integer "user_id"
    t.integer "patient_id"
    t.integer "clinic_history_id"
    t.string "tiempo_libre"
    t.string "hace_solo"
    t.string "no_gusta"
    t.string "deportes"
    t.string "juegos"
    t.string "programa_tv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "provider"
    t.string "acces_token"
    t.string "refresh_token"
    t.string "uid"
    t.string "token"
    t.string "names"
    t.string "last_names"
    t.integer "admin_user"
    t.boolean "account"
    t.boolean "super_admin"
    t.date "birth_date"
    t.integer "count"
    t.string "avatar"
    t.integer "rol_id"
    t.string "document_type"
    t.string "document"
    t.string "medical_record"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company"
    t.boolean "legal"
    t.string "ip_address"
    t.string "device"
    t.bigint "phone"
    t.datetime "expires_at"
    t.string "expires_ats"
    t.text "firma_psicologo"
    t.string "firma_adjunta"
    t.string "tipo_firma"
    t.string "professional_card"
    t.text "signature_format"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
