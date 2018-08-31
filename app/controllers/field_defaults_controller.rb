class FieldDefaultsController < ApplicationController
  before_action :set_field_default, only: [:show, :edit, :update, :destroy]

  # GET /field_defaults
  # GET /field_defaults.json
  def index
    @field_defaults = FieldDefault.all
  end

  # GET /field_defaults/1
  # GET /field_defaults/1.json
  def show
  end

  # GET /field_defaults/new
  def new
    @field_default = FieldDefault.new
  end

  def cambiar_state
    @field_default = FieldDefault.where(admin_user: current_user.admin_user)

   
    estado = params[:estado]


    if estado === "true"
      puts "entro true"
      estado_b = true
    elsif estado === "false"
      puts "entro false"
      estado_b = false
    end

    puts estado
    puts estado_b


    field = params[:field]

    if field == "observation"

      @field_default.update(observation_tracing_state: estado_b)

    elsif field == "evolution"

      @field_default.update(evolution_tracing_state: estado_b)

    elsif field == "description"

      @field_default.update(description_tracing_state: estado_b)
      
    end

  end
  






  # GET /field_defaults/1/edit
  def edit
  end

  # POST /field_defaults
  # POST /field_defaults.json
  def create
    @field_default = FieldDefault.new(field_default_params)

    respond_to do |format|
      if @field_default.save
        format.html { redirect_to @field_default, notice: 'Field default was successfully created.' }
        format.json { render :show, status: :created, location: @field_default }
      else
        format.html { render :new }
        format.json { render json: @field_default.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_defaults/1
  # PATCH/PUT /field_defaults/1.json
  def update
    respond_to do |format|
      if @field_default.update(field_default_params)
        format.html { redirect_to @field_default, notice: 'Field default was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_default }
      else
        format.html { render :edit }
        format.json { render json: @field_default.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_defaults/1
  # DELETE /field_defaults/1.json
  def destroy
    @field_default.destroy
    respond_to do |format|
      format.html { redirect_to field_defaults_url, notice: 'Field default was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_default
      @field_default = FieldDefault.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_default_params
      params.require(:field_default).permit(:user_id, :admin_user, :account_id, :observation_tracing_state, :evolution_tracing_state, :description_tracing_state)
    end
end
