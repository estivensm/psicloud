class ToolTestsController < ApplicationController
  def index
  	 @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

def create

        #maximum = User.where(admin_user: current_user.admin_user).maximum(:count) + 1 
        @tool_test= ToolTest.create(user_id:current_user.id,admin_user:current_user.admin_user,patient_id:params[:patient_id],clinic_history_id:params[:clinic_history_id],description: params[:description],type_tool:params[:type_tool],attachment: params[:attachment])
        if @tool_test.save
           
            redirect_to patient_clinic_history_tool_tests_path(params[:patient_id],params[:clinic_history_id])
  end
end
    
  def show
  end

  def new
  	 @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  def edit
  end
end
