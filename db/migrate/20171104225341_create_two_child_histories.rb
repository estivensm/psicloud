class CreateTwoChildHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :two_child_histories do |t|
      t.string :nivel_escolar
      t.string :indice_academico
      t.string :escuela
      t.string :adaptacion_escolar
      t.string :problemas_escolares
      t.string :gustos_escolares
      t.string :disgustos_escolares
      t.string :tareas
      t.string :utiles_escolares
      t.string :problemas_materias
      t.string :relacion_maestro
      t.string :relacion_companeros
      t.string :frecuencia_amigos
      t.string :edad_amigos
      t.string :tipo_juegos
      t.string :actividades_mismo_sexo
      t.string :actividades_otro_sexo
      t.string :pelea
      t.string :motivo_felicidad
      t.string :motivo_tristeza
      t.string :motivo_enojo
      t.string :motivos_pregunta
      t.string :habitos
      t.integer :admin_user
      t.integer :user_id
      t.integer :patient_id
      t.integer :clinic_history_id
      t.string :tiempo_libre
      t.string :hace_solo
      t.string :no_gusta
      t.string :deportes
      t.string :juegos
      t.string :programa_tv
      
      t.timestamps
    end
  end
end
