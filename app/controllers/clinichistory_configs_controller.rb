class ClinichistoryConfigsController < ApplicationController
  before_action :set_clinichistory_config, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /clinichistory_configs
  # GET /clinichistory_configs.json
  def index
    @clinichistory_configs = ClinichistoryConfig.all
  end

  # GET /clinichistory_configs/1
  # GET /clinichistory_configs/1.json
  def show
  end

  # GET /clinichistory_configs/new
  def new
    @clinichistory_config = ClinichistoryConfig.new
  end

  # GET /clinichistory_configs/1/edit
  def edit
  end

  # POST /clinichistory_configs
  # POST /clinichistory_configs.json
  def create
    @clinichistory_config = ClinichistoryConfig.new(clinichistory_config_params)

    respond_to do |format|
      if @clinichistory_config.save
        format.html { redirect_to @clinichistory_config, notice: 'Clinichistory config was successfully created.' }
        format.json { render :show, status: :created, location: @clinichistory_config }
      else
        format.html { render :new }
        format.json { render json: @clinichistory_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinichistory_configs/1
  # PATCH/PUT /clinichistory_configs/1.json
  def update
    respond_to do |format|
      if @clinichistory_config.update(clinichistory_config_params)
        format.html { redirect_to @clinichistory_config, notice: 'Clinichistory config was successfully updated.' }
        format.json { render :show, status: :ok, location: @clinichistory_config }
      else
        format.html { render :edit }
        format.json { render json: @clinichistory_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinichistory_configs/1
  # DELETE /clinichistory_configs/1.json
  def destroy
    @clinichistory_config.destroy
    respond_to do |format|
      format.html { redirect_to clinichistory_configs_url, notice: 'Clinichistory config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinichistory_config
      @clinichistory_config = ClinichistoryConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinichistory_config_params
      params.require(:clinichistory_config).permit(:header_image, :footer_image, :header_text, :footer_text, :state, :admin_user, :user_id)
    end
end
