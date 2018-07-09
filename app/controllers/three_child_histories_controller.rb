class ThreeChildHistoriesController < ApplicationController
    before_action :authenticate_user!
  before_action :set_three_child_history, only: [:show, :edit, :update, :destroy]
   layout 'admin_patient'
  # GET /three_child_histories
  # GET /three_child_histories.json
  def index
    @three_child_histories = ThreeChildHistory.all
  end

  # GET /three_child_histories/1
  # GET /three_child_histories/1.json
  def show
  end

  # GET /three_child_histories/new
  def new
    @three_child_history = ThreeChildHistory.new
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # GET /three_child_histories/1/edit
  def edit
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # POST /three_child_histories
  # POST /three_child_histories.json
  def create
    @three_child_history = ThreeChildHistory.new(three_child_history_params)
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    respond_to do |format|
      if @three_child_history.save
        format.html { redirect_to patient_clinic_history_tool_tests_path(@clinic_history.patient_id,@clinic_history.id), notice: 'Three child history was successfully created.' }
        format.json { render :show, status: :created, location: @three_child_history }
      else
        format.html { render :new }
        format.json { render json: @three_child_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /three_child_histories/1
  # PATCH/PUT /three_child_histories/1.json
  def update
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    if @clinic_history.first_child_four  != true

                  @clinic_history.four_child_created_at = Date.today
                  @clinic_history.first_child_four  = true
                  @clinic_history.save
                  

         end 
    respond_to do |format|
      if @three_child_history.update(three_child_history_params)
        format.html { redirect_to patient_clinic_history_tool_tests_path(@clinic_history.patient_id,@clinic_history.id), notice: 'Three child history was successfully updated.' }
        format.json { render :show, status: :ok, location: @three_child_history }
      else
        format.html { render :edit }
        format.json { render json: @three_child_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /three_child_histories/1
  # DELETE /three_child_histories/1.json
  def destroy
    @three_child_history.destroy
    respond_to do |format|
      format.html { redirect_to three_child_histories_url, notice: 'Three child history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_three_child_history
      @three_child_history = ThreeChildHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def three_child_history_params
      params.require(:three_child_history).permit(:destete, :gustos_alimentos, :dejado_alimentacion, :tipo_alimentacion, :reaccion_defecacion, :succion_dedo, :masturbacion, :duerme_con, :visto_acto_sexual, :conocimientos_sexualidad, :informacion_sexual, :menarquia, :experiencia_menarquia, :polucion, :experiencia_polucion, :fue_informado, :reacciones_emocionales, :noviazgo, :aceptacion_noviazgo, :sintomas_neuroticos, :descripcion_sintomas, :responsable_disiplina, :comportamientos_molestos, :tipos_de_castigo, :observaciones, :user_id, :admini_user, :patient_id, :clinic_history_id)
    end
end
