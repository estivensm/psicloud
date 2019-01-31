class CreateSecondRips < ActiveRecord::Migration[5.1]
  def change
    create_table :second_rips do |t|
      t.string :codigo_prestador
      t.integer :user_id
      t.integer :admin_user
      t.string :tipo_identificacion
      t.string :numero_identificacion
      t.string :numero_factura
      t.string :fecha_expedicion_factura
      t.string :fecha_inicio
      t.string :fecha_final
      t.string :codigo_entidad_administradora
      t.string :nombre_entidad_
      t.string :administradora
      t.string :numero_contrato
      t.string :plan_beneficiados
      t.string :numero_poliza
      t.string :valor_pago_compartido
      t.string :valor_comision
      t.string :valor_total_descuentos
      t.string :valor_pagar_entidad

      t.timestamps
    end
  end
end

