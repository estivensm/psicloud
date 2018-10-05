class DiagnosticHelpsController < ApplicationController
  before_action :set_diagnostic_help, only: [:show, :edit, :update, :destroy]
  layout 'admin_patient'

  # GET /diagnostic_helps
  # GET /diagnostic_helps.json
  def index
    @diagnostic_helps = DiagnosticHelp.where(admin_user: current_user.admin_user)
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # GET /diagnostic_helps/1
  # GET /diagnostic_helps/1.json
  def show
  end

  # GET /diagnostic_helps/new
  def new
    @diagnostic_help = DiagnosticHelp.new
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # GET /diagnostic_helps/1/edit
  def edit
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # POST /diagnostic_helps
  # POST /diagnostic_helps.json
  def create
    @diagnostic_help = DiagnosticHelp.new(diagnostic_help_params)

    respond_to do |format|
      if @diagnostic_help.save
        format.html { redirect_to  patient_clinic_history_diagnostic_helps_path(params[:patient_id],params[:clinic_history_id]), notice: 'Diagnostic help was successfully created.' }
        format.json { render :show, status: :created, location: @diagnostic_help }
      else
        format.html { render :new }
        format.json { render json: @diagnostic_help.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diagnostic_helps/1
  # PATCH/PUT /diagnostic_helps/1.json
  def update
    respond_to do |format|
      if @diagnostic_help.update(diagnostic_help_params)
        format.html { redirect_to patient_clinic_history_diagnostic_helps_path(params[:patient_id],params[:clinic_history_id]), notice: 'Diagnostic help was successfully updated.' }
        format.json { render :show, status: :ok, location: @diagnostic_help }
      else
        format.html { render :edit }
        format.json { render json: @diagnostic_help.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnostic_helps/1
  # DELETE /diagnostic_helps/1.json
  def destroy
    @diagnostic_help.destroy
    respond_to do |format|
      format.html { redirect_to patient_clinic_history_diagnostic_helps_path(params[:patient_id],params[:clinic_history_id]), notice: 'Diagnostic help was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnostic_help
      @diagnostic_help = DiagnosticHelp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnostic_help_params
      params.require(:diagnostic_help).permit(:name, :description, :type_document, :user_id, :admin_user, :clinic_history_id, :patient_id,general_files_attributes: [:id, :name, :file,:user_id,:admin_user,:tool_test_id,:_destroy])
    end
end
