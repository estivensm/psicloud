class TwoChildHistoriesController < ApplicationController
  before_action :set_two_child_history, only: [:show, :edit, :update, :destroy]

  # GET /two_child_histories
  # GET /two_child_histories.json
  def index
    @two_child_histories = TwoChildHistory.all
  end

  # GET /two_child_histories/1
  # GET /two_child_histories/1.json
  def show
  end

  # GET /two_child_histories/new
  def new
    @two_child_history = TwoChildHistory.new
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # GET /two_child_histories/1/edit
  def edit
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # POST /two_child_histories
  # POST /two_child_histories.json
  def create
    @two_child_history = TwoChildHistory.new(two_child_history_params)

    respond_to do |format|
      if @two_child_history.save
        format.html { redirect_to @two_child_history, notice: 'Two child history was successfully created.' }
        format.json { render :show, status: :created, location: @two_child_history }
      else
        format.html { render :new }
        format.json { render json: @two_child_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /two_child_histories/1
  # PATCH/PUT /two_child_histories/1.json
  def update
    respond_to do |format|
      if @two_child_history.update(two_child_history_params)
        format.html { redirect_to @two_child_history, notice: 'Two child history was successfully updated.' }
        format.json { render :show, status: :ok, location: @two_child_history }
      else
        format.html { render :edit }
        format.json { render json: @two_child_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /two_child_histories/1
  # DELETE /two_child_histories/1.json
  def destroy
    @two_child_history.destroy
    respond_to do |format|
      format.html { redirect_to two_child_histories_url, notice: 'Two child history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_two_child_history
      @two_child_history = TwoChildHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def two_child_history_params
      params.require(:two_child_history).permit(:nivel_escolar, :indice_academico, :escuela, :adaptacion_escolar, :problemas_escolares, :gustos_escolares, :disgustos_escolares, :tareas, :utiles_escolares, :problemas_materias, :relacion_maestro, :relacion_companeros, :frecuencia_amigos, :edad_amigos, :tipo_juegos, :actividades_mismo_sexo, :actividades_otro_sexo, :pelea, :motivo_felicidad, :motivo_tristeza, :motivo_enojo, :motivos_pregunta, :habitos, :admin_user, :user_id, :patient_id, :clinic_history_id,:programa_tv,:juegos,:deportes,:no_gusta,:hace_solo,:tiempo_libre)
    end
end
