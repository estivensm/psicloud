class BackgroundsController  < ApplicationController

def index
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])

end	

def create

        #maximum = User.where(admin_user: current_user.admin_user).maximum(:count) + 1 
        @background = Background.create(user_id:current_user.id,admin_user:current_user.admin_user,patient_id:params[:patient_id],clinic_history_id:params[:clinic_history_id],description: params[:description],type_background:params[:type_background], clase: params[:clase],attachment: params[:attachment])
        if @background.save
           
            redirect_to patient_clinic_history_backgrounds_path(params[:patient_id],params[:clinic_history_id])
  end
    
end

def show


end

def new
 @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    @clase = params[:clase]
end	
	


def edit
    
end



end