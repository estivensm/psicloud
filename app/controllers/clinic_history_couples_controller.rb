class ClinicHistoryCouplesController < ApplicationController
  before_action :set_clinic_history_couple, only: [:show, :edit, :update, :destroy, :history_couple]
  before_action :all_patient, only: [:show, :new, :create, :edit, :history_couple]
  before_action :authenticate_user!
  layout "admin", only: [:index, :new, :edit]
  # GET /clinic_history_couples
  # GET /clinic_history_couples.json
  def index
    @clinic_history_couples = ClinicHistoryCouple.all.paginate(page: params[:page],:per_page => 10)
  end

  # GET /clinic_history_couples/1
  # GET /clinic_history_couples/1.json
  def show
     @clinic_history_couple_outcome = ClinicHistoryCoupleOutcome.where(clinic_history_couple_id: @clinic_history_couple.id ).first
     render :layout => "admin_clinic_history_couple"
  end

  # GET /clinic_history_couples/new
  def new
    @clinic_history_couple = ClinicHistoryCouple.new
  end



  def history_couple
    @clinic_history_couple_outcome = ClinicHistoryCoupleOutcome.where(clinic_history_couple_id: @clinic_history_couple.id ).first
    @seguimientos = TracingFamily.where(clinic_history_family_id: @clinic_history_couple.id)
    @documentos_tool = DocumentFamily.where(document_type: "tool").where(clinic_history_family_id: @clinic_history_couple.id)
    @documentos_diagnostic = DocumentFamily.where(document_type: "diagnostic").where(clinic_history_family_id: @clinic_history_couple.id)
    @documentos_legal = DocumentFamily.where(document_type: "legal").where(clinic_history_family_id: @clinic_history_couple.id)

    respond_to do |format|
        format.html
        format.pdf do
          render :pdf => "formatos1",
          :template => 'clinic_history_couples/pdfs/history_couple.pdf.erb',
          :layout => 'pdf.html.erb',
          :show_as_html => params[:debug].present?
      end
    end 
  end


  def paciente
    @patient = Patient.find(params[:id])
    render json: @patient
  end

  # GET /clinic_history_couples/1/edit
  def edit
     @clinic_history_couple_outcome = @clinic_history_couple.clinic_history_couple_outcome
     render :layout => "admin_clinic_history_couple"
  end

  # POST /clinic_history_couples
  # POST /clinic_history_couples.json
  def create
    @clinic_history_couple = ClinicHistoryCouple.new(clinic_history_couple_params)
    respond_to do |format|
      if @clinic_history_couple.save
        format.html { redirect_to edit_clinic_history_couple_path(@clinic_history_couple.id), notice: 'Clinic history couple was successfully updated.' }
        format.json { render :show, status: :created, location: @clinic_history_couple }
      else
        format.html { render :new }
        format.json { render json: @clinic_history_couple.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinic_history_couples/1
  # PATCH/PUT /clinic_history_couples/1.json
  def update
    respond_to do |format|
      if @clinic_history_couple.update(clinic_history_couple_params)
        format.html { 
          redirect_to @clinic_history_couple, notice: 'Clinic history couple was successfully updated.'

          }
        format.json { render :show, status: :ok, location: @clinic_history_couple }
      else
        format.html { render :edit }
        format.json { render json: @clinic_history_couple.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinic_history_couples/1
  # DELETE /clinic_history_couples/1.json
  def destroy
    @clinic_history_couple.destroy
    respond_to do |format|
      format.html { redirect_to clinic_history_couples_url, notice: 'Clinic history couple was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic_history_couple
      @clinic_history_couple = ClinicHistoryCouple.find(params[:id])
    end

    def all_patient
      @patients = Patient.where(admin_user: current_user.admin_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_history_couple_params
      params.require(:clinic_history_couple).permit(:patient_id, :previous_unions_patient, :previous_unions_couple, :previous_children_patient, :previous_children_couple, :problematic_conduct_patient, :problematic_conduct_couple, :consultation_reason, :general_observations, :actual_situations, :couple_patient_id)
    end
end
