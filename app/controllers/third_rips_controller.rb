class ThirdRipsController < ApplicationController
  before_action :set_third_rip, only: [:show, :edit, :update, :destroy]

  # GET /third_rips
  # GET /third_rips.json
  def index
    @third_rips = ThirdRip.all
  end
  
    def csv_all
    @third_rips = ThirdRip.all
    respond_to do |format|
       format.csv { send_data @third_rips.to_csv, filename: "third_rips.csv" }
    end  
  end
  # GET /third_rips/1
  # GET /third_rips/1.json
  def show
  end

  # GET /third_rips/new
  def new
    @third_rip = ThirdRip.new
  end

  # GET /third_rips/1/edit
  def edit
  end

  # POST /third_rips
  # POST /third_rips.json
  def create
    @third_rip = ThirdRip.new(third_rip_params)

    respond_to do |format|
      if @third_rip.save
        format.html { redirect_to @third_rip, notice: 'Third rip was successfully created.' }
        format.json { render :show, status: :created, location: @third_rip }
      else
        format.html { render :new }
        format.json { render json: @third_rip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /third_rips/1
  # PATCH/PUT /third_rips/1.json
  def update
    respond_to do |format|
      if @third_rip.update(third_rip_params)
        format.html { redirect_to @third_rip, notice: 'Third rip was successfully updated.' }
        format.json { render :show, status: :ok, location: @third_rip }
      else
        format.html { render :edit }
        format.json { render json: @third_rip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /third_rips/1
  # DELETE /third_rips/1.json
  def destroy
    @third_rip.destroy
    respond_to do |format|
      format.html { redirect_to third_rips_url, notice: 'Third rip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_third_rip
      @third_rip = ThirdRip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def third_rip_params
      params.require(:third_rip).permit(:user_id, :admin_user, :numero_factura, :codigo_prestador, :tipo_identificacion_usuario, :numero_identificacion_usuario, :fecha_consulta, :numero_autorizacion, :codigo_consulta, :finalidad_consulta, :causa_externa, :codigo_diagnostico, :codigo_diagnostico_uno, :codigo_diagnostico_dos, :codigo_diagnostico_tres, :tipo_diagnostico_principal, :valor_consulta, :valor_cuota_moderadora, :valor_neto_pagar)
    end
end
