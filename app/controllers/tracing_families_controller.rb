class TracingFamiliesController < ApplicationController
  before_action :set_tracing_family, only: [:show, :edit, :update, :destroy]
  before_action :set_history_family
  layout "admin_clinic_history_family"

  # GET /tracing_families
  # GET /tracing_families.json
  def index
    @tracing_families = TracingFamily.where(clinic_history_family_id: @clinic_history_family.id).paginate(page: params[:page],:per_page => 20)
  end

  # GET /tracing_families/1
  # GET /tracing_families/1.json
  def show
  end

  # GET /tracing_families/new
  def new
    @tracing_family = TracingFamily.new
  end

  # GET /tracing_families/1/edit
  def edit
  end

  # POST /tracing_families
  # POST /tracing_families.json
  def create
    @tracing_family = TracingFamily.new(tracing_family_params)

    respond_to do |format|
      if @tracing_family.save
        format.html { redirect_to clinic_history_family_tracing_families_path(@clinic_history_family), notice: 'Tracing family was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @tracing_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracing_families/1
  # PATCH/PUT /tracing_families/1.json
  def update
    respond_to do |format|
      if @tracing_family.update(tracing_family_params)
        format.html { redirect_to @tracing_family, notice: 'Tracing family was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracing_family }
      else
        format.html { render :edit }
        format.json { render json: @tracing_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracing_families/1
  # DELETE /tracing_families/1.json
  def destroy
    @tracing_family.destroy
    respond_to do |format|
      format.html { render :index }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracing_family
      @tracing_family = TracingFamily.find(params[:id])
    end

    def set_history_family
      @clinic_history_family = ClinicHistoryFamily.find(params[:clinic_history_family_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracing_family_params
      params.require(:tracing_family).permit(:clinic_history_family_id, :admin_user, :user_id, :description, :attachment, :tracing_type, :tracing_date, :observation, :evolution, :tracing_state, general_files_attributes: [:id, :name, :file,:user_id,:admin_user,:tool_test_id,:_destroy])
    end
end
