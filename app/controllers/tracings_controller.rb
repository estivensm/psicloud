class TracingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tracing, only: [:show, :edit, :update, :destroy]
  before_action :set_tracing_info, only: [:index,:show, :edit, :update, :destroy, :new]
 
  layout 'admin_patient'
  # GET /tracings
  # GET /tracings.json
  def index
        @field_default = FieldDefault.where(admin_user: current_user.admin_user).first

    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    @tracings = Tracing.where(admin_user: current_user.admin_user, clinic_history_id: @clinic_history.id).paginate(page: params[:page],:per_page => 10)
    
      @hpcs = Hpc.where(admin_user: current_user.admin_user).order(created_at: :desc)
      @agreements = Agreement.where(admin_user: current_user.admin_user).order(created_at: :desc)
      @clinic_history = @patient.clinic_histories.first
      
  end

  # GET /tracings/1
  # GET /tracings/1.json
  def show
  end

  # GET /tracings/new
  def new
    @field_default = FieldDefault.where(admin_user: current_user.admin_user).first
    @tracing = Tracing.new
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    @tracings = Tracing.where(admin_user: current_user.admin_user, clinic_history_id: @clinic_history.id).paginate(page: params[:page],:per_page => 10)
    @hpcs = Hpc.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @agreements = Agreement.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @clinic_history = @patient.clinic_histories.first
  end

  # GET /tracings/1/edit
  def edit
    @field_default = FieldDefault.where(admin_user: current_user.admin_user).first
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    @tracings = Tracing.where(admin_user: current_user.admin_user, clinic_history_id: @clinic_history.id).paginate(page: params[:page],:per_page => 10)
    @hpcs = Hpc.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @agreements = Agreement.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @clinic_history = @patient.clinic_histories.first
  end

  # POST /tracings
  # POST /tracings.json
  def create
    @tracing = Tracing.new(tracing_params)
    @tracing.tracing_state = false
    @tracing.tracing_created_at = Time.now
    @clinic_history = @tracing.clinic_history
    respond_to do |format|
      if @tracing.save
          
        Field.where(admin_user: current_user.admin_user).where(state: true).where(form: "Seguimiento").order(id: :asc).each do |field|
                  
                 
                  CreteField.create(content: params[:"#{field.name}"], user_id: current_user.id, admin_user:current_user.id, field_id: field.id, clinic_history_id: @clinic_history.id, tracing_id: @tracing.id)
              


        end
      


        format.html { redirect_to patient_clinic_history_tracings_path(params[:patient_id],params[:clinic_history_id]), notice: 'El Seguimiento se Creo con exito!' }
        format.json { render :show, status: :created, location: @tracing }
         flash[:partial] = 'El Seguimiento se Creo con exito!'
      else
        format.html { redirect_to root_path }
        format.json { render json: @tracing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracings/1
  # PATCH/PUT /tracings/1.json
  def update
    @clinic_history = @tracing.clinic_history
    respond_to do |format|
      if @tracing.update(tracing_params)
        if params[:remove_attachment]
              @tracing.remove_attachment!
              @tracing.save
            end  
         Field.where(admin_user: current_user.admin_user).where(state: true).where(form: "Seguimeintos").order(id: :asc).each do |field|
                  
                 if !CreteField.where(clinic_history_id: @clinic_history.id).where(field_id: field.id).any?
                  CreteField.create(content: params[:"#{field.name}"], user_id: current_user.id, admin_user:current_user.id, field_id: field.id, clinic_history_id: @clinic_history.id, tracing_id: @tracing.id)
                 else
                   CreteField.where(clinic_history_id: @clinic_history.id).where(field_id: field.id).where(tracing_id: @tracing.id).last.update(content: params[:"#{field.name}"])

                 end


        end    
        format.html { redirect_to patient_clinic_history_tracings_path(params[:patient_id],params[:clinic_history_id]), notice: 'Tracing was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracing }
      else
        format.html { render :edit }
        format.json { render json: @tracing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracings/1
  # DELETE /tracings/1.json
  def destroy
    @tracing.destroy
    respond_to do |format|
      format.html { redirect_to patient_clinic_history_tracings_path(params[:patient_id],params[:clinic_history_id]), notice: 'Tracing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracing
      @tracing = Tracing.find(params[:id])
    end

    def set_tracing_info
      
      if controller_name == "clinic_history_couples"
        @clinic_history_couple = ClinicHistoryCouple.find(params[:clinic_history_couple_id])
      else
        @clinic_history = ClinicHistory.find(params[:clinic_history_id])
        @patient = Patient.find(params[:patient_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracing_params
      params.require(:tracing).permit(:admin_user, :user_id, :patient_id, :clinic_history_id, :evolution, :observation, :description,:tracing_state,:tracing_created_at, :attachment, :tracing_type, :tracing_date,:remove_attachment, general_files_attributes: [:id, :name, :file,:user_id,:admin_user,:tool_test_id,:_destroy])
    end
end
