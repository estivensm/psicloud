class SecondRipsController < ApplicationController
  before_action :set_second_rip, only: [:show, :edit, :update, :destroy]

  # GET /second_rips
  # GET /second_rips.json
  def index
    @second_rips = SecondRip.all
  end

  def csv_all
    @second_rips = SecondRip.all
    respond_to do |format|
       format.csv { send_data @second_rips.to_csv, filename: "second_rips.csv" }
    end  
  end

  # GET /second_rips/1
  # GET /second_rips/1.json
  def show
  end

  # GET /second_rips/new
  def new
    @second_rip = SecondRip.new
  end

  # GET /second_rips/1/edit
  def edit
  end

  # POST /second_rips
  # POST /second_rips.json
  def create
    @second_rip = SecondRip.new(second_rip_params)

    respond_to do |format|
      if @second_rip.save
        format.html { redirect_to @second_rip, notice: 'Second rip was successfully created.' }
        format.json { render :show, status: :created, location: @second_rip }
      else
        format.html { render :new }
        format.json { render json: @second_rip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /second_rips/1
  # PATCH/PUT /second_rips/1.json
  def update
    respond_to do |format|
      if @second_rip.update(second_rip_params)
        format.html { redirect_to @second_rip, notice: 'Second rip was successfully updated.' }
        format.json { render :show, status: :ok, location: @second_rip }
      else
        format.html { render :edit }
        format.json { render json: @second_rip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /second_rips/1
  # DELETE /second_rips/1.json
  def destroy
    @second_rip.destroy
    respond_to do |format|
      format.html { redirect_to second_rips_url, notice: 'Second rip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_second_rip
      @second_rip = SecondRip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def second_rip_params
      params.require(:second_rip).permit(:codigo_prestador, :user_id, :admin_user, :tipo_identificacion, :numero_identificacion, :numero_factura, :fecha_expedicion_factura, :fecha_inicio, :fecha_final, :codigo_entidad_administradora, :nombre_entidad_, :administradora, :numero_contrato, :plan_beneficiados, :numero_poliza, :valor_pago_compartido, :valor_comision, :valor_total_descuentos, :valor_pagar_entidad)
    end
end
