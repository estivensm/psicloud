class PersonalHistoriesController < ApplicationController
  before_action :set_personal_history, only: [:show, :edit, :update, :destroy]

  # GET /personal_histories
  # GET /personal_histories.json
  def index
    @personal_histories = PersonalHistory.all
  end

  # GET /personal_histories/1
  # GET /personal_histories/1.json
  def show
  end

  # GET /personal_histories/new
  def new

    @personal_history = PersonalHistory.new
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # GET /personal_histories/1/edit
  def edit
        @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # POST /personal_histories
  # POST /personal_histories.json
  def create
    @personal_history = PersonalHistory.new(personal_history_params)
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    respond_to do |format|
      if @personal_history.save
        format.html { redirect_to edit_patient_clinic_history_two_child_history_path(@clinic_history.patient_id,@clinic_history.id,@clinic_history.two_child_history.id), notice: 'Personal history was successfully created.' }
        format.json { render :show, status: :created, location: @personal_history }
      else
        format.html { render :new }
        format.json { render json: @personal_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_histories/1
  # PATCH/PUT /personal_histories/1.json
  def update
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    respond_to do |format|
      if @personal_history.update(personal_history_params)
        format.html { redirect_to edit_patient_clinic_history_two_child_history_path(@clinic_history.patient_id,@clinic_history.id,@clinic_history.two_child_history.id), notice: 'Personal history was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_history }
      else
        format.html { render :edit }
        format.json { render json: @personal_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_histories/1
  # DELETE /personal_histories/1.json
  def destroy
    @personal_history.destroy
    respond_to do |format|
      format.html { redirect_to personal_histories_url, notice: 'Personal history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_history
      @personal_history = PersonalHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_history_params
      params.require(:personal_history).permit(:embarazo, :hijo_deseado, :dificultades_prenatales, :periodo_prenatal, :parto, :peso_nacimiento, :talla_nacimiento, :latencia_materna, :biberon, :semisolidos, :solidos, :problemas_alimentacion, :dificultad_dormir, :reacciones, :edad_gateo, :edad_pie, :edad_caminar, :inicio_lenguaje, :enfermedades_medicas, :hospitalizacion_cirugias, :problemas_visoperceptivomotores, :accout_id, :user_id, :admin_user, :patient_id, :clinic_history_id)
    end
end
