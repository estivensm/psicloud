# == Schema Information
#
# Table name: third_rips
#
#  id                            :integer          not null, primary key
#  user_id                       :integer
#  admin_user                    :integer
#  numero_factura                :string
#  codigo_prestador              :string
#  tipo_identificacion_usuario   :string
#  numero_identificacion_usuario :string
#  fecha_consulta                :string
#  numero_autorizacion           :string
#  codigo_consulta               :string
#  finalidad_consulta            :string
#  causa_externa                 :string
#  codigo_diagnostico            :string
#  codigo_diagnostico_uno        :string
#  codigo_diagnostico_dos        :string
#  codigo_diagnostico_tres       :string
#  tipo_diagnostico_principal    :string
#  valor_consulta                :string
#  valor_cuota_moderadora        :string
#  valor_neto_pagar              :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

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
