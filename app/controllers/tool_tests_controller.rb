class ToolTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tool_test, only: [:show, :edit, :update, :destroy]
  layout 'admin_patient'

  def index
  	 @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

def create

        #maximum = User.where(admin_user: current_user.admin_user).maximum(:count) + 1 
        @tool_test= ToolTest.create(tool_test_params)
        if @tool_test.save
            
            redirect_to patient_clinic_history_tool_tests_path(params[:patient_id],params[:clinic_history_id])
  end
end
    
  def show
  end

  def new

    @tool_test = ToolTest.new
  	@patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])

  end



  def edit
    @tool_test = ToolTest.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  def update
       @tool_test = ToolTest.find(params[:id])
        if @tool_test.update(tool_test_params)
             if params[:remove_attachment]
               @tool_test.remove_attachment!
              @tool_test.save
            end  
            redirect_to patient_clinic_history_tool_tests_path(params[:patient_id],params[:clinic_history_id])
  end
  end

  def destroy
    @tool_test = ToolTest.find(params[:id])
    if @tool_test.destroy
           
            redirect_to patient_clinic_history_tool_tests_path(params[:patient_id],params[:clinic_history_id])
    end

    
  end

   private
    def set_tool_test
      @tool_test = ToolTest.find(params[:id])
    end
  
   def tool_test_params
      params.require(:tool_test).permit(:user_id, :admin_user, :patient_id, :clinic_history_id,:attachment,:description,:type_tool)
    end

end

