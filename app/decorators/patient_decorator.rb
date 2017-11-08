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
      ['Union Libre', 'Union Libre']
    ]
  end

  def select_grupo_etnico
    [
      ['Ninguno', 'Ninguno'],
      ['Mestizo', 'Meztizo'],
      ['Afro Desendiente', 'Afro Desendiente']
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
end
