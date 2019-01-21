class ClinicHistoryCoupleOutcomesController < ApplicationController
  before_action :set_clinic_history_couple_outcome, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin_clinic_history_couple'


  # GET /clinic_history_couple_outcomes
  # GET /clinic_history_couple_outcomes.json
  def index
    @clinic_history_couple_outcomes = ClinicHistoryCoupleOutcome.all
  end

  # GET /clinic_history_couple_outcomes/1
  # GET /clinic_history_couple_outcomes/1.json
  def show
  end

  # GET /clinic_history_couple_outcomes/new
  def new
    @clinic_history_couple_outcome = ClinicHistoryCoupleOutcome.new
  end

  # GET /clinic_history_couple_outcomes/1/edit
  def edit
    @clinic_history_couple = ClinicHistoryCouple.find(params[:clinic_history_couple_id])
  end

  # POST /clinic_history_couple_outcomes
  # POST /clinic_history_couple_outcomes.json
  def create
    @clinic_history_couple_outcome = ClinicHistoryCoupleOutcome.new(clinic_history_couple_outcome_params)
    @clinic_history_couple = ClinicHistoryCouple.find(params[:clinic_history_couple_id])
    respond_to do |format|
      if @clinic_history_couple_outcome.save
        format.html { redirect_to @clinic_history_couple_outcome, notice: 'Clinic history couple outcome was successfully created.' }
        format.json { render :show, status: :created, location: @clinic_history_couple_outcome }
      else
        format.html { render :new }
        format.json { render json: @clinic_history_couple_outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinic_history_couple_outcomes/1
  # PATCH/PUT /clinic_history_couple_outcomes/1.json
  def update
    @clinic_history_couple = ClinicHistoryCouple.find(params[:clinic_history_couple_id])
    respond_to do |format|
      if @clinic_history_couple_outcome.update(clinic_history_couple_outcome_params)
        flash[:success] = "El Desenlace se Actualizo con exito!"
        format.html { redirect_to clinic_history_couple_path(@clinic_history_couple.id), notice: 'Clinic history couple outcome was successfully updated.' }
        format.json { render :show, status: :ok, location: @clinic_history_couple_outcome }
      else
        format.html { render :edit }
        format.json { render json: @clinic_history_couple_outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinic_history_couple_outcomes/1
  # DELETE /clinic_history_couple_outcomes/1.json
  def destroy
    @clinic_history_couple_outcome.destroy
    respond_to do |format|
      format.html { redirect_to clinic_history_couple_outcomes_url, notice: 'Clinic history couple outcome was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic_history_couple_outcome
      @clinic_history_couple_outcome = ClinicHistoryCoupleOutcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_history_couple_outcome_params
      params.require(:clinic_history_couple_outcome).permit(:clinic_history_family_id, :clinic_history_couple_id, :diagnostic_description, :therapeutic_goal, :type_of_treatment, :diagnostic_ids => [], :first_diagnostico_ids => [] )
    end
end
