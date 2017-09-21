module ApplicationHelper
	
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
        @menu = ["active1","na","na","na","na"]
     elsif controller.controller_name == "views"
        @menu = ["na","active1","na","na","na"]
     elsif controller.controller_name == "patients"
        @menu = ["na","na","active1","na","na"]
     elsif controller.controller_name == "clinic_histories"
        @menu = ["na","na","na","active1","na"]
     else
        @menu = ["na","na","na","na","active1"]
  end

  return @menu

end


end
