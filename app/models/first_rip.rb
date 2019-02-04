# == Schema Information
#
# Table name: first_rips
#
#  id                    :integer          not null, primary key
#  tipo_identificacion   :string
#  numero_identificacion :string
#  codigo_entidad_admin  :string
#  tipo_usuario          :string
#  primer_apellido       :string
#  segundo_apellido      :string
#  primer_nombre         :string
#  segundo_nombre        :string
#  edad                  :string
#  unidad_medida_edad    :string
#  sexo                  :string
#  codigo_dpto           :string
#  codigo_municipio      :string
#  zona_residencial      :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#  admin_user            :integer
#

class FirstRip < ApplicationRecord

	 def self.to_csv()
          attributes = %w{tipo_identificacion numero_identificacion codigo_entidad_admin tipo_usuario primer_apellido segundo_apellido primer_nombre segundo_nombre edad unidad_medida_edad sexo codigo_dpto codigo_municipio zona_residencial}
            CSV.generate(headers: false) do |csv|
              csv <<  attributes
              all.each do |first_rip|
               csv << attributes.map{ |attr| first_rip.send(attr) }
              end
            end
        end  

       

end
