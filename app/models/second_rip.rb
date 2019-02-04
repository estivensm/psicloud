# == Schema Information
#
# Table name: second_rips
#
#  id                            :integer          not null, primary key
#  codigo_prestador              :string
#  user_id                       :integer
#  admin_user                    :integer
#  tipo_identificacion           :string
#  numero_identificacion         :string
#  numero_factura                :string
#  fecha_expedicion_factura      :string
#  fecha_inicio                  :string
#  fecha_final                   :string
#  codigo_entidad_administradora :string
#  nombre_entidad_               :string
#  administradora                :string
#  numero_contrato               :string
#  plan_beneficiados             :string
#  numero_poliza                 :string
#  valor_pago_compartido         :string
#  valor_comision                :string
#  valor_total_descuentos        :string
#  valor_pagar_entidad           :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

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
