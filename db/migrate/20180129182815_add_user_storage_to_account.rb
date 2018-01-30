class AddUserStorageToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :file_size_add, :integer
    add_column :accounts, :users_quantity_add, :integer
    add_column :accounts, :file_size_now, :integer
    add_column :accounts, :users_quantity_now, :integer
  end
end




User.create(aprobado_login: "Si", email: "sistemas@aerosanidadsas.com", nombre_usuario:"caro12345",nombres:"Carolina", apellidos: "Arroyave", tipo_documento:"Cedula de Ciudadania", documento:"1017156114", rol_id:1, password:"Alejo0906", password_confirmation:"Alejo0906")