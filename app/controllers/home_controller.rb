class HomeController < ApplicationController
	 before_action :authenticate_user!
  def index
    @clinic_history = ClinicHistory.where(user_id: current_user.id).where(child_history: false).where('extract(year  from created_date) = ?', (Time.now.year))
    @clinic_history1 = ClinicHistory.where(user_id: current_user.id).where('extract(year  from created_date) = ?', (Time.now.year))
    
    @mes = Array.new
    @mes1 = Array.new
    12.times.each do |mes|
    	
        @mes <<  @clinic_history.where('extract(month  from created_date) = ?', (mes+ 1)).count
        @mes1 <<  @clinic_history1.where('extract(month  from created_date) = ?', (mes+ 1)).count

    end    

    
     

    @citas = Appointment.where(user_id: current_user.id)
  	 if params[:search].present?
        @pacientes = Patient.where(user_id: current_user.id).search(params[:search]).page(params[:page]).per_page(12)
    end


    if request.xhr?
      render partial: 'personas', status: 200
    end

  end
end
