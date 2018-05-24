class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :patient_id
      t.text :description
      t.date :fecha_compromiso
      t.integer :appointment_id
      t.boolean :estado
      t.date :fecha_entrega
      t.boolean :cumplimiento
      t.string :file

      t.timestamps
    end
  end
end
