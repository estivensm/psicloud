json.extract! first_rip, :id, :tipo_identificacion, :numero_identificacion, :codigo_entidad_admin, :tipo_usuario, :primer_apellido, :segundo_apellido, :primer_nombre, :segundo_nombre, :edad, :unidad_medida_edad, :sexo, :codigo_dpto, :codigo_municipio, :zona_residencial, :created_at, :updated_at
json.url first_rip_url(first_rip, format: :json)
