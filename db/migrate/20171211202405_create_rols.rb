class CreateRols < ActiveRecord::Migration[5.1]
  def change
    create_table :rols do |t|
      t.boolean :show_user
      t.boolean :create_user
      t.boolean :edit_user
      t.boolean :delete_user
      t.boolean :show_patient
      t.boolean :create_patient
      t.boolean :edit_patient
      t.boolean :delete_patient
      t.boolean :show_hc
      t.boolean :create_hc
      t.boolean :edit_hc
      t.boolean :delete_hc
      t.boolean :show_cita
      t.boolean :create_cita
      t.boolean :edit_cita
      t.boolean :delete_cita
      t.boolean :show_doc
      t.boolean :create_doc
      t.boolean :edit_doc
      t.boolean :delete_doc
      t.boolean :show_rol
      t.boolean :create_rol
      t.boolean :edit_rol
      t.boolean :delete_rol
      t.boolean :configuracion
      t.integer :admin_user
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
