module PatientDecorator

	
  def select_genero
  	[
      ['Masculino', 'Masculino'],
      ['Femenino', 'Femenino'],
      ['Transexual', 'Transexual']
    ]
  end

	
	def select_documento
		[
      ['Cedula de Ciudadania', 'Cedula de Ciudadania'],
      ['Tarjeta de Identidad', 'Tarjeta de Identidad'],
      ['Cédula de Extranjeria', 'Cedula de Extranjeria'],
      ['Pasaporte', 'Pasaporte'],
      ['Menor Sin Identificación', 'Menor Sin Identificación'],
      ['Adulto Sin Identificación', 'Adulto Sin Identificación'],
      ['Carnet Diplomático', 'Carnet Diplomático']
     
  	]
	end



	def select_sangre
		[
      ['A-', 'A-'],
      ['A+', 'A+'],
      ['B-', 'B-'],
      ['B+', 'B+'],
      ['AB-', 'AB-'],
      ['AB+', 'AB+'],            
      ['O-', 'O-'],
      ['O+', 'O+'],
      ['No Especificado', 'No Especificado']
 	]
	end

end
