module ApplicationHelper
	

def get_state(state)

  state == true ? a = "<i class='fa fa-check' aria-hidden='true'></i>" : a = "<i class='fa fa-times' aria-hidden='true'></i>"
  
end


def get_open(state)

  state == true ? "<i class='fas fa-lock'></i>" : "<i class='fas fa-lock-open'></i>"
  
end

def state_si_o_no(state)

  state == true ? "Si" : "No"
  
end


def state_history(history)

  history = ClinicHistory.find(history)
 if  (history.first_contact_state && !history.child_history) || (history.child_history && history.first_child_state && history.second_child_state && history.third_child_state && history.second_child_state)
      
      "<i class='fas fa-lock' style = 'font-size:25px;'></i>"

 else 

     "<i class='fas fa-lock-open' style = 'font-size:25px;'></i>"

 end
 
  
end
def state_history_desenlace(history)

  history = ClinicHistory.find(history)
 if  (history.outcome_state )
      
      "<i class='fas fa-lock' style = 'font-size:25px;'></i>"

 else 

     "<i class='fas fa-lock-open' style = 'font-size:25px;'></i>"

 end
 
end



  
def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end


  def page_entries_info(collection, options = {})
  entry_name = options[:entry_name] || (collection.empty?? 'Reporte' :
      collection.first.class.name.split('::').last.titleize)
  if collection.total_pages < 2
    case collection.size
    when 0; "No hay #{entry_name.pluralize} registrados"
    else; %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
    end
  else
    %{Mostrando %d de %d #{entry_name.pluralize}} % [
      collection.length ,
      collection.total_entries
    ]
  end
end

def get_account

  Account.where(admin_user: current_user.admin_user).first.id
  
end
def get_account1

  Account.where(admin_user: current_user.admin_user).first
  
end

def get_diagnostic

  Diagnostic.all
  
end

def get_diagnostico

  
  Diagnostico.all

  
end

def get_first_diagnostico

  
  FirstDiagnostico.all

  
end

def get_patient
  
  Patient.where(admin_user: current_user.admin_user)
  
end


def get_hpc

  Hpc.where(admin_user: current_user.admin_user)
end

def get_ag

  Agreement.where(admin_user: current_user.admin_user)
end

def get_users

  User.where(admin_user: current_user.admin_user)
end


def select_relacion
    [
      ['Estable', 'Estable'],
      ['Inestable', 'Inestable'],
      ['Conflictiva', 'Conflictiva'],
      ['Mucha', 'Mucha'],
       ['Poca', 'Poca'],
        ['Nada', 'Nada']

    ]
  end
  def select_relacion_parents
    [
      ['Buena', 'Buena'],
      ['Regular', 'Regular'],
      ['Mala', 'Mala'],
      ['Separados ', 'Separados'],
       ['Divorciados', 'Divorciados'],
        ['Abandono total de un miembro', 'Abandono total de un miembro']

    ]
  end




  def type_document(type)

    type == "Cedula de Ciudadania" ? "C.C" : type
      
      
  end


def action_type
    
   if action_name == "new" 
    return "Crear"
else
     return "Editar"
    end
end




def menu
          
  @menu = ["","","","",""]
  if  controller.controller_name == "home" 
        @menu = ["active","na","na","na","na","na", "na","na"]
     elsif controller.controller_name == "views"
        @menu = ["na","na","na","na","active","na", "na","na"]
     elsif (controller.controller_name == "patients" && (action_name == "index" || action_name == "new" || action_name == "show")) || controller_name == "child_general_dates" || controller_name == "personal_histories" || controller_name == "two_child_histories" || controller_name == "three_child_histories" || controller_name == "tracings" || controller_name == "tool_tests" || controller_name == "backgrounds" || controller_name == "tasks"
        @menu = ["na","na","active","na","na","na", "na","na"]
     elsif (controller.controller_name == "appointments" && action_name == "citas") || controller.controller_name == "appointments" && action_name == "index"
        @menu = ["na","na","na","active","na","na", "na","na"]
     elsif controller.controller_name == "clinic_histories"
        @menu = ["na","na","active","na","na","na", "na","na"]
      elsif controller.controller_name == "documents"
        @menu = ["na","na","na","na","na", "active", "na","na"]  
      elsif controller.controller_name == "stats" && action_name == "index"
        @menu = ["na","na","na","na","na", "na", "active","na"]  
      elsif (controller.controller_name == "patients" && action_name == "all_patients") || (action_name == "citas_admin") || (action_name == "general_stats")
        @menu = ["na","na","na","na","na", "na","na", "active"]    
     else
        @menu = ["na","na","na","na","active"]
  end

  return @menu

end



def menu_patient
          
  @menu_patient = ["","","","","", "", "", ""]
  if  controller.controller_name == "backgrounds" 
        @menu_patient = ["edit-active","noactive","noactive","noactive","noactive","noactive","noactive","noactive"]

  elsif  controller.controller_name == "tool_tests"       
        @menu_patient = ["noactive","edit-active","noactive","noactive","noactive","noactive","noactive","noactive"]

  elsif  controller.controller_name == "appointments"       
        @menu_patient = ["noactive","noactive","edit-active","noactive","noactive","noactive","noactive","noactive"]


  elsif  controller.controller_name == "tracings"       
        @menu_patient = ["noactive","noactive","noactive","edit-active","noactive","noactive","noactive","noactive"]


  elsif  controller.controller_name == "tasks"       
        @menu_patient = ["noactive","noactive","noactive","noactive","edit-active","noactive","noactive","noactive"]
  
 
elsif  controller.controller_name == "patients"       
        @menu_patient = ["noactive","noactive","noactive","noactive","noactive","noactive","edit-active","noactive"]  

elsif  controller.controller_name == "clinic_histories" && action_name == "step3"       
        @menu_patient = ["noactive","noactive","noactive","noactive","noactive","noactive","noactive","edit-active"]  


elsif  (controller.controller_name == "clinic_histories" && (action_name == "edit"  )) || controller_name = "child_general_dates"   || controller_name = "personal_histories" || controller_name = "two_child_histories" || controller_name = "three_child_histories"      
        @menu_patient = ["noactive","noactive","noactive","noactive","noactive","edit-active","noactive","noactive"]
  


  end

  return @menu_patient

end






def get_date(fecha)
   
if fecha != nil
    ds = fecha.strftime("%w") #Dia de la semana
    y = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "Enero", "02" => "Febrero","03"=>"Marzo","04" => "Abril", "05" => "Mayo","06"=> "Junio" ,"07"=> "Julio", "08" => "Agosto", "09"=> "Septiembre" ,"10"=> "Octubre","11" => "Noviembre" ,"12" => "Diciembre" }
    dias = {"7" => "Domingo", "1" => "Lunes","2"=>"Martes","3" => "Miercoles", "4" => "Jueves","5"=> "Viernes" ,"6" =>"Sabado"}
    fecha.min < 10 ? min = "0" : min = ""
    fecha.hour < 10 ? hora = "0" : hora = ""
    return  meses[m] + " " + dm + ", " + y  
#dias[ds] + ", " +
end 
end


def get_only_date(fecha)
   
if fecha != nil
    ds = fecha.strftime("%w") #Dia de la semana
    y = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "Enero", "02" => "Febrero","03"=>"Marzo","04" => "Abril", "05" => "Mayo","06"=> "Junio" ,"07"=> "Julio", "08" => "Agosto", "09"=> "Septiembre" ,"10"=> "Octubre","11" => "Noviembre" ,"12" => "Diciembre" }
    dias = {"0" => "Domingo", "1" => "Lunes","2"=>"Martes","3" => "Miercoles", "4" => "Jueves","5"=> "Viernes" ,"6" =>"Sabado"}
    return  dias[ds] + " " + dm + " de " + meses[m] + ", " + y  
#dias[ds] + ", " +
end 
end

def get_date_hora(fecha)

if fecha != nil
    ds = fecha.strftime("%w") #Dia de la semana
    y = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "Ene", "02" => "Feb","03"=>"Mar","04" => "Abr", "05" => "May","06"=> "Jun" ,"07"=> "Jul", "08" => "Ago", "09"=> "Sep" ,"10"=> "Oct","11" => "Nov" ,"12" => "Dic" }
    dias = {"0" => "Domingo", "1" => "Lunes","2"=>"Martes","3" => "Miercoles", "4" => "Jueves","5"=> "Viernes" ,"6" =>"Sabado"}
    fecha.min < 10 ? min = "0" : min = ""
    horat = fecha.hour > 12 ?   fecha.hour - 12 : fecha.hour
    horati = fecha.hour > 12 ?   "pm" : "am"
    fecha.hour < 10 ? hora = "0" : hora = ""
    return  dias[ds] + " " + dm + " de "+  meses[m] + " "  + ", " + y + ", " + hora + horat.to_s   + ":" + min + fecha.min.to_s + " " + horati
#dias[ds] + ", " +
end 


end


def get_date_hora_only(fecha)

if fecha != nil
    ds = fecha.strftime("%w") #Dia de la semana
    y = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "Ene", "02" => "Feb","03"=>"Mar","04" => "Abr", "05" => "May","06"=> "Jun" ,"07"=> "Jul", "08" => "Ago", "09"=> "Sep" ,"10"=> "Oct","11" => "Nov" ,"12" => "Dic" }
    dias = {"0" => "Domingo", "1" => "Lunes","2"=>"Martes","3" => "Miercoles", "4" => "Jueves","5"=> "Viernes" ,"6" =>"Sabado"}
    fecha.min < 10 ? min = "0" : min = ""
    horat = fecha.hour > 12 ?   fecha.hour - 12 : fecha.hour
    horati = fecha.hour > 12 ?   "pm" : "am"
    fecha.hour < 10 ? hora = "0" : hora = ""
    return  hora + horat.to_s   + ":" + min + fecha.min.to_s + " " + horati
#dias[ds] + ", " +
end 


end





def get_date_array(fecha)
   
if fecha != nil
    ds = fecha.strftime("%w") #Dia de la semana
    yi = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "Enero", "02" => "Febrero","03"=>"Marzo","04" => "Abril", "05" => "Mayo","06"=> "Junio" ,"07"=> "Julio", "08" => "Agosto", "09"=> "Septiembre" ,"10"=> "Octubre","11" => "Noviembre" ,"12" => "Diciembre" }
    dias = {"7" => "Domingo", "1" => "Lunes","2"=>"Martes","3" => "Miercoles", "4" => "Jueves","5"=> "Viernes" ,"6" =>"Sabado"}
    fecha.min < 10 ? min = "0" : min = ""
    fecha.hour < 10 ? hora = "0" : hora = ""
    
    date = Array.new
    tipo = fecha.hour > 12 ? "pm" : "am"
    horat = fecha.hour > 12 ?   fecha.hour - 12 : fecha.hour
    horas  = hora + horat.to_s + ":" + min + fecha.min.to_s + " "+ tipo
    date = [dm, dias[ds], meses[m].upcase ,m  ,yi , horas]
    return date
#dias[ds] + ", " +
end 
end


end

