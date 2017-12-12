class RolsController < ApplicationController
  before_action :set_rol, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /rols
  # GET /rols.json
  def index
    @rols = Rol.where(admin_user: current_user.admin_user).or(Rol.where(default:true)).paginate(page: params[:page],:per_page => 20)
  end

  # GET /rols/1
  # GET /rols/1.json
  def show
  end

  # GET /rols/new
  def new
    @rol = Rol.new
  end

  # GET /rols/1/edit
  def edit
  end

  # POST /rols
  # POST /rols.json
  def create
    @rol = Rol.new(rol_params)

    respond_to do |format|
      if @rol.save
        format.html { redirect_to rols_path, notice: 'Rol was successfully created.' }
        format.json { render :show, status: :created, location: @rol }
      else
        format.html { render :new }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rols/1
  # PATCH/PUT /rols/1.json
  def update
    respond_to do |format|
      if @rol.update(rol_params)
        format.html { redirect_to rols_path, notice: 'Rol was successfully updated.' }
        format.json { render :show, status: :ok, location: @rol }
      else
        format.html { render :edit }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rols/1
  # DELETE /rols/1.json
  def destroy
    @rol.destroy
    respond_to do |format|
      format.html { redirect_to rols_url, notice: 'Rol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol
      @rol = Rol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rol_params
      params.require(:rol).permit(:show_user, :create_user, :edit_user, :delete_user, :show_patient, :create_patient, :edit_patient, :delete_patient, :show_hc, :create_hc, :edit_hc, :delete_hc, :show_cita, :create_cita, :edit_cita, :delete_cita, :show_doc, :create_doc, :edit_doc, :delete_doc, :show_rol, :create_rol, :edit_rol, :delete_rol, :configuracion, :admin_user, :user_id, :name, :description)
    end
end
