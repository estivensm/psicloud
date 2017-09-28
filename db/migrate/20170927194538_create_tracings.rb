class CreateTracings < ActiveRecord::Migration[5.1]
  def change
    create_table :tracings do |t|
      t.integer :admin_user
      t.integer :user_id
      t.integer :patient_id
      t.integer :clinic_history_id
      t.text :description
      t.string :attachment
      t.string :tracing_type

      t.timestamps
    end
  end
end
