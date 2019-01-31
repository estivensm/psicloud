class ThirdRip < ApplicationRecord

			 def self.to_csv()
          attributes = %w{numero_factura codigo_prestador tipo_identificacion_usuario numero_identificacion_usuario fecha_consulta numero_autorizacion codigo_consulta finalidad_consulta causa_externa codigo_diagnostico codigo_diagnostico_uno codigo_diagnostico_dos codigo_diagnostico_tres tipo_diagnostico_principal valor_consulta valor_cuota_moderadora valor_neto_pagar }
            CSV.generate(headers: false) do |csv|
              csv <<  attributes
              all.each do |third_rip|
               csv << attributes.map{ |attr| third_rip.send(attr) }
              end
            end
        end  

end
