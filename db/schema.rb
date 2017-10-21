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

ActiveRecord::Schema.define(version: 20171021161749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  create_table "clinic_histories_diagnostics", id: false, force: :cascade do |t|
    t.bigint "clinic_history_id"
    t.bigint "diagnostic_id"
    t.index ["clinic_history_id"], name: "index_clinic_histories_diagnostics_on_clinic_history_id"
    t.index ["diagnostic_id"], name: "index_clinic_histories_diagnostics_on_diagnostic_id"
  end

  create_table "clinic_history_diagnostic", id: false, force: :cascade do |t|
    t.bigint "clinic_history_id"
    t.bigint "diagnostic_id"
    t.index ["clinic_history_id"], name: "index_clinic_history_diagnostic_on_clinic_history_id"
    t.index ["diagnostic_id"], name: "index_clinic_history_diagnostic_on_diagnostic_id"
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

  create_table "hpcs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id"
    t.integer "admin_user"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "movil"
    t.string "city"
    t.text "data"
    t.integer "hpc_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
