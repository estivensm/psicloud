class HpcsController < ApplicationController
  before_action :set_hpc, only: [:show, :edit, :update, :destroy]

  # GET /hpcs
  # GET /hpcs.json
  def index
    @hpcs = Hpc.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 3)
  end

  # GET /hpcs/1
  # GET /hpcs/1.json
  def show
  end

  # GET /hpcs/new
  def new
    @hpc = Hpc.new
  end

  # GET /hpcs/1/edit
  def edit
  end

  # POST /hpcs
  # POST /hpcs.json
  def create
    @hpc = Hpc.new(hpc_params)

    respond_to do |format|
      if @hpc.save
        format.html { redirect_to hpcs_url, notice: 'Hpc was successfully created.' }
        format.json { render :show, status: :created, location: @hpc }
      else
        format.html { render :new }
        format.json { render json: @hpc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hpcs/1
  # PATCH/PUT /hpcs/1.json
  def update
    respond_to do |format|
      if @hpc.update(hpc_params)
        format.html { redirect_to hpcs_url, notice: 'Hpc was successfully updated.' }
        format.json { render :show, status: :ok, location: @hpc }
      else
        format.html { render :edit }
        format.json { render json: @hpc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hpcs/1
  # DELETE /hpcs/1.json
  def destroy
    @hpc.destroy
    respond_to do |format|
      format.html { redirect_to hpcs_url, notice: 'Hpc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hpc
      @hpc = Hpc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hpc_params
      params.require(:hpc).permit(:name, :description, :user_id, :admin_user)
    end
end
