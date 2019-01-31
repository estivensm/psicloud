class CreateThirdRips < ActiveRecord::Migration[5.1]
  def change
    create_table :third_rips do |t|
      t.integer :user_id
      t.integer :admin_user
      t.string :numero_factura
      t.string :codigo_prestador
      t.string :tipo_identificacion_usuario
      t.string :numero_identificacion_usuario
      t.string :fecha_consulta
      t.string :numero_autorizacion
      t.string :codigo_consulta
      t.string :finalidad_consulta
      t.string :causa_externa
      t.string :codigo_diagnostico
      t.string :codigo_diagnostico_uno
      t.string :codigo_diagnostico_dos
      t.string :codigo_diagnostico_tres
      t.string :tipo_diagnostico_principal
      t.string :valor_consulta
      t.string :valor_cuota_moderadora
      t.string :valor_neto_pagar

      t.timestamps
    end
  end
end
