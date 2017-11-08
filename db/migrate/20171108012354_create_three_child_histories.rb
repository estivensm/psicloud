class CreateThreeChildHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :three_child_histories do |t|
      t.string :destete
      t.string :gustos_alimentos
      t.string :dejado_alimentacion
      t.string :tipo_alimentacion
      t.string :reaccion_defecacion
      t.string :succion_dedo
      t.string :masturbacion
      t.string :duerme_con
      t.string :visto_acto_sexual
      t.string :conocimientos_sexualidad
      t.string :informacion_sexual
      t.integer :menarquia
      t.string :experiencia_menarquia
      t.integer :polucion
      t.string :experiencia_polucion
      t.string :fue_informado
      t.string :reacciones_emocionales
      t.string :noviazgo
      t.string :aceptacion_noviazgo
      t.string :sintomas_neuroticos
      t.string :descripcion_sintomas
      t.string :responsable_disiplina
      t.string :comportamientos_molestos
      t.string :tipos_de_castigo
      t.string :observaciones
      t.integer :user_id
      t.integer :admin_user
      t.integer :patient_id
      t.integer :clinic_history_id

      t.timestamps
    end
  end
end
