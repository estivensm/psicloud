class StatsController < ApplicationController
  def index
        #Grafica Edades
        @pacientes_menores = Patient.where(user_id: current_user.id).where('age > ? AND age < ? ',0,13).count
        @pacientes_adolecentes = Patient.where(user_id: current_user.id).where('age > ? AND age < ? ',13,19).count
        @pacientes_mayores = Patient.where(user_id: current_user.id).where('age > ?',18).count
        
        #Grafica Genero
        @pacientes_masculinos = Patient.where(user_id: current_user.id).where(gender: "Masculino").count
        @pacientes_femeninos = Patient.where(user_id: current_user.id).where(gender: "Femenino").count
        @pacientes_transexuales = Patient.where(user_id: current_user.id).where(gender:'Transexual').count
        
        #Grafica Pacientes Atendidos por mes
        @clinic_history = ClinicHistory.where(user_id: current_user.id).where(child_history: false).where('extract(year  from created_date) = ?', (Time.now.year))
        @clinic_history1 = ClinicHistory.where(user_id: current_user.id).where('extract(year  from created_date) = ?', (Time.now.year))
    
        @mes = Array.new
        @mes1 = Array.new
        12.times.each do |mes|
    	    @mes <<  @clinic_history.where('extract(month  from created_date) = ?', (mes+ 1)).count
            @mes1 <<  @clinic_history1.where('extract(month  from created_date) = ?', (mes+ 1)).count

        end  

        #Grafica Pacientes Activos e Inactivos  
        @pacientes_activos = Patient.where(user_id: current_user.id).where(state:true).count
        @pacientes_inactivos = Patient.where(user_id: current_user.id).where(state:false).count


  end

  def general_stats
        #Grafica Edades
        @pacientes_menores = Patient.where(admin_user: current_user.admin_user).where('age > ? AND age < ? ',0,13).count
        @pacientes_adolecentes = Patient.where(admin_user: current_user.admin_user).where('age > ? AND age < ? ',13,19).count
        @pacientes_mayores = Patient.where(admin_user: current_user.admin_user).where('age > ?',18).count
        
        #Grafica Genero
        @pacientes_masculinos = Patient.where(admin_user: current_user.admin_user).where(gender: "Masculino").count
        @pacientes_femeninos = Patient.where(admin_user: current_user.admin_user).where(gender: "Femenino").count
        @pacientes_transexuales = Patient.where(admin_user: current_user.admin_user).where(gender:'Transexual').count
        
        #Grafica Pacientes Atendidos por mes
        @clinic_history = ClinicHistory.where(admin_user: current_user.admin_user).where(child_history: false).where('extract(year  from created_date) = ?', (Time.now.year))
        @clinic_history1 = ClinicHistory.where(admin_user: current_user.admin_user).where('extract(year  from created_date) = ?', (Time.now.year))
    
        @mes = Array.new
        @mes1 = Array.new
        12.times.each do |mes|
            @mes <<  @clinic_history.where('extract(month  from created_date) = ?', (mes+ 1)).count
            @mes1 <<  @clinic_history1.where('extract(month  from created_date) = ?', (mes+ 1)).count

        end  

        #Grafica Pacientes Activos e Inactivos  
        @pacientes_activos = Patient.where(admin_user: current_user.admin_user).where(state:true).count
        @pacientes_inactivos = Patient.where(admin_user: current_user.admin_user).where(state:false).count


  end


end
