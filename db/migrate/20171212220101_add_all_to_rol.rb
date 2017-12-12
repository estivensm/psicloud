class AddAllToRol < ActiveRecord::Migration[5.1]
  def change
    add_column :rols, :show_all_user, :boolean
    add_column :rols, :show_all_patient, :boolean
    add_column :rols, :show_all_hc, :boolean
    add_column :rols, :show_all_cita, :boolean
    add_column :rols, :show_all_doc, :boolean
    add_column :rols, :show_all_rol, :boolean
  end
end
