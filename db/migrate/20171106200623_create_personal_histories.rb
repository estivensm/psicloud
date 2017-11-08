class CreatePersonalHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_histories do |t|
      t.string :embarazo
      t.string :hijo_deseado
      t.text :dificultades_prenatales
      t.string :periodo_prenatal
      t.string :parto
      t.float :peso_nacimiento
      t.float :talla_nacimiento
      t.integer :latencia_materna
      t.integer :biberon
      t.string :semisolidos
      t.string :solidos
      t.string :problemas_alimentacion
      t.string :dificultad_dormir
      t.string :reacciones
      t.integer :edad_gateo
      t.integer :edad_pie
      t.integer :edad_caminar
      t.integer :inicio_lenguaje
      t.string :enfermedades_medicas
      t.string :hospitalizacion_cirugias
      t.string :problemas_visoperceptivomotores
      t.integer :accout_id
      t.integer :user_id
      t.integer :admin_user
      t.integer :patient_id
      t.integer :clinic_history_id

      t.timestamps
    end
  end
end
