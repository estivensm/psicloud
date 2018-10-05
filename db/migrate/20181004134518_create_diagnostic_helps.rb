class CreateDiagnosticHelps < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnostic_helps do |t|
      t.string :name
      t.text :description
      t.string :type_document
      t.integer :user_id
      t.integer :admin_user
      t.integer :clinic_history_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
