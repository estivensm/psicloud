class TracingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tracing, only: [:show, :edit, :update, :destroy]
  before_action :set_tracing_info, only: [:index,:show, :edit, :update, :destroy, :new]
 
  layout 'admin_patient'
  # GET /tracings
  # GET /tracings.json
  def index
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
    @tracing = Tracing.new
  end

  # GET /tracings/1/edit
  def edit
  end

  # POST /tracings
  # POST /tracings.json
  def create
    @tracing = Tracing.new(tracing_params)

    respond_to do |format|
      if @tracing.save
        format.html { redirect_to patient_clinic_history_tracings_path(params[:patient_id],params[:clinic_history_id]), notice: 'Tracing was successfully created.' }
        format.json { render :show, status: :created, location: @tracing }
      else
        format.html { redirect_to root_path }
        format.json { render json: @tracing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracings/1
  # PATCH/PUT /tracings/1.json
  def update
    respond_to do |format|
      if @tracing.update(tracing_params)
        if params[:remove_attachment]
              @tracing.remove_attachment!
              @tracing.save
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
      @patient = Patient.find(params[:patient_id])
      @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracing_params
      params.require(:tracing).permit(:admin_user, :user_id, :patient_id, :clinic_history_id, :description, :attachment, :tracing_type, :tracing_date,:remove_attachment)
    end
end
