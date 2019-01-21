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