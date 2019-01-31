class SecondRip < ApplicationRecord

		 def self.to_csv()
          attributes = %w{codigo_prestador tipo_identificacion numero_identificacion numero_factura fecha_expedicion_factura fecha_inicio fecha_final codigo_entidad_administradora nombre_entidad_ administradora numero_contrato plan_beneficiados numero_poliza valor_pagar_entidad valor_comision valor_total_descuentos valor_pago_compartido}
            CSV.generate(headers: false) do |csv|
              csv <<  attributes
              all.each do |second_rip|
               csv << attributes.map{ |attr| second_rip.send(attr) }
              end
            end
        end  

       
end
