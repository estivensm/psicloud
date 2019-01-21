class FirstRipsController < ApplicationController
  before_action :set_first_rip, only: [:show, :edit, :update, :destroy]

  # GET /first_rips
  # GET /first_rips.json
  def index
    @first_rips = FirstRip.all
  end
  

  def csv_all
    @first_rips = FirstRip.all
    respond_to do |format|
       format.csv { send_data @first_rips.to_csv, filename: "first_rips.csv" }
    end  
  end

  # GET /first_rips/1
  # GET /first_rips/1.json
  def show
  end

  # GET /first_rips/new
  def new
    @first_rip = FirstRip.new
  end

  # GET /first_rips/1/edit
  def edit
  end

  # POST /first_rips
  # POST /first_rips.json
  def create
    @first_rip = FirstRip.new(first_rip_params)

    respond_to do |format|
      if @first_rip.save
        format.html { redirect_to @first_rip, notice: 'First rip was successfully created.' }
        format.json { render :show, status: :created, location: @first_rip }
      else
        format.html { render :new }
        format.json { render json: @first_rip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /first_rips/1
  # PATCH/PUT /first_rips/1.json
  def update
    respond_to do |format|
      if @first_rip.update(first_rip_params)
        format.html { redirect_to @first_rip, notice: 'First rip was successfully updated.' }
        format.json { render :show, status: :ok, location: @first_rip }
      else
        format.html { render :edit }
        format.json { render json: @first_rip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_rips/1
  # DELETE /first_rips/1.json
  def destroy
    @first_rip.destroy
    respond_to do |format|
      format.html { redirect_to first_rips_url, notice: 'First rip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first_rip
      @first_rip = FirstRip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def first_rip_params
      params.require(:first_rip).permit(:tipo_identificacion, :numero_identificacion, :codigo_entidad_admin, :tipo_usuario, :primer_apellido, :segundo_apellido, :primer_nombre, :segundo_nombre, :edad, :unidad_medida_edad, :sexo, :codigo_dpto, :codigo_municipio, :zona_residencial)
    end
end
