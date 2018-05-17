class BackgroundsController  < ApplicationController

def index
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])

end	

def create

        #maximum = User.where(admin_user: current_user.admin_user).maximum(:count) + 1 
        @background = Background.create(user_id:current_user.id,admin_user:current_user.admin_user,patient_id:params[:patient_id],clinic_history_id:params[:clinic_history_id],description: params[:description],type_background:params[:type_background],attachment: params[:attachment])
        if @background.save
           
            redirect_to patient_clinic_history_backgrounds_path(params[:patient_id],params[:clinic_history_id])
  end
    
end

def show


end

def new
 @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
   
end	
	


def edit
    puts params[:id]
    puts "holaaaaaaaaaaaaa"
    @background = Background.find(params[:id])
    puts @background.description
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  def update
       @background = Background.find(params[:background])
        if @background.update(description: params[:description],type_background:params[:type_background],attachment: params[:attachment])
            if params[:remove_attachment]
               @background.remove_attachment!
              @background.save
            end  
            redirect_to patient_clinic_history_backgrounds_path(params[:patient_id],params[:clinic_history_id])
  end
  end

  def destroy
    @background = Background.find(params[:id])
    if @background.destroy
           
            redirect_to patient_clinic_history_backgrounds_path(params[:patient_id],params[:clinic_history_id])
    end

    
  end





def create_background_personal

        #maximum = User.where(admin_user: current_user.admin_user).maximum(:count) + 1 
        @background = PersonalBackground.create(user_id:current_user.id,admin_user:current_user.admin_user,patient_id:params[:patient_id],clinic_history_id:params[:clinic_history_id],description: params[:description],type_background:params[:type_background],attachement: params[:attachment])
        if @background.save
           
            redirect_to patient_clinic_history_backgrounds_path(params[:patient_id],params[:clinic_history_id])
  end
    
end


def new_background_personal
 @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
   
end 
  


def edit_background_personal

    @background = PersonalBackground.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  def update_background_personal
       @background = PersonalBackground.find(params[:background])
        if @background.update(description: params[:description],type_background:params[:type_background],attachement: params[:attachment])
              if params[:remove_attachment]
               @background.remove_attachement!
              @background.save
            end  
            redirect_to patient_clinic_history_backgrounds_path(params[:patient_id],params[:clinic_history_id])
  end
  end

  def destroy_background_personal
    @background = PersonalBackground.find(params[:id])
    if @background.destroy
           
            redirect_to patient_clinic_history_backgrounds_path(params[:patient_id],params[:clinic_history_id])
    end

    
  end



end