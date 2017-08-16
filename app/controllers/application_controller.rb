class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    [:account_update,:sign_up].each do |metodo|
    devise_parameter_sanitizer.permit(metodo, keys: [:email,:names,:last_names,:admin_user,:rol_id,:avatar, :birth_date,:document,:document_type, :medical_record,:state])
    end
  end



layout :layout_for_selection
protected
  def layout_for_selection
    if controller_name == 'sessions'  || controller_name == 'passwords' 
      'application'
    elsif controller_name == 'registrations'

        if action_name == "new" || action_name == "create"
            'application'
            else
            	'admin'
        end
    	else
      'admin'
    end
  end
end
