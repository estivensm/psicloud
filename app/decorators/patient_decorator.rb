module PatientDecorator


 def select_grado
    [
      ['Jardin', 'Jardin'],
      ['Prescolar', 'Prescolar'],
      ['Transición', 'Transición'],
      ['Primero de Primaria', 'Primero de Primaria'],

    ]
  end
	
  def select_genero
  	[
      ['Masculino', 'Masculino'],
      ['Femenino', 'Femenino'],
      ['Transexual', 'Transexual']
    ]
  end

    def select_estado_civil
    [
      ['Soltero', 'Soltero'],
      ['Casado', 'Casado'],
      ['Unión Libre', 'Unión libre.'],
      ['Divorciado', 'Divorciado'],
      ['Viud@', 'Viud@'],
      ['N/A', 'N/A']
    ]
  end

  def select_grupo_etnico
    [
      ['Ninguno', 'Ninguno'],
      ['Afrocolombiano', 'Afro Desendiente'],
      ['Indigena', 'Indigena'],
      ['Raizal', 'Raizal'],
      ['Gitano', 'Gitano'],
      
    ]
  end

	
	def select_documento
		[
      ['Cédula de Ciudadanía', 'Cédula de Ciudadanía'],
      ['Tarjeta de Identidad', 'Tarjeta de Identidad'],
      ['Registro Civil de Nacimiento', 'Registro Civil de Nacimiento'],
      ['Cédula de Extranjeria', 'Cedula de Extranjeria'],
      ['Pasaporte', 'Pasaporte'],
      ['Menor sin Identificación', 'Menor sin Identificación'],
      ['Adulto sin Identificación', 'Adulto sin Identificación'],
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


    def select_tools
    [
      ['Entrevista Clinica', 'Entrevista Clinica'],
      ['Observación', 'Observación'],
      ['Test proyectivo', 'Test proyectivo'],
      ['Test Objetivo', 'Test Objetivo'],
      ['Escalas de evaluación o inventarios', 'Escalas de evaluación o inventarios'],
      ['Cuestionarios', 'Cuestionarios'],
      ['Genograma', 'Genograma']
    ]
  end

  def select_type
    [
      ['Psicologico', 'Psicologico'],
      ['Psiquiatrico', 'Psiquiatrico'],
      ['Toxico', 'Toxico'],
      ['Medico', 'Medico'],

    ]
  end


  def select_type
    [
      ['Psicologico', 'Psicologico'],
      ['Psiquiatrico', 'Psiquiatrico'],
      ['Toxico', 'Toxico'],
      ['Medico', 'Medico'],

    ]
  end
end
