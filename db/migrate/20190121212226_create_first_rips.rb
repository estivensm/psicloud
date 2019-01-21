class CreateFirstRips < ActiveRecord::Migration[5.1]
  def change
    create_table :first_rips do |t|
      t.string :tipo_identificacion
      t.string :numero_identificacion
      t.string :codigo_entidad_admin
      t.string :tipo_usuario
      t.string :primer_apellido
      t.string :segundo_apellido
      t.string :primer_nombre
      t.string :segundo_nombre
      t.string :edad
      t.string :unidad_medida_edad
      t.string :sexo
      t.string :codigo_dpto
      t.string :codigo_municipio
      t.string :zona_residencial

      t.timestamps
    end
  end
end
