class TracingCoupleFamiliesController < ApplicationController
  before_action :set_tracing_couple_family, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "admin_clinic_history_couple"
  # GET /tracing_couple_families
  # GET /tracing_couple_families.json
  def index
    @tracing_couple_families = TracingCoupleFamily.all.paginate(page: params[:page],:per_page => 10)
  end

  # GET /tracing_couple_families/1
  # GET /tracing_couple_families/1.json
  def show
  end

  # GET /tracing_couple_families/new
  def new
    @tracing_couple_family = TracingCoupleFamily.new
  end

  # GET /tracing_couple_families/1/edit
  def edit

  end

  # POST /tracing_couple_families
  # POST /tracing_couple_families.json
  def create
    @tracing_couple_family = TracingCoupleFamily.new(tracing_couple_family_params)

    respond_to do |format|
      if @tracing_couple_family.save
        format.html { redirect_to tracing_couple_families_path, notice: 'Tracing couple family was successfully created.' }
        format.json { render :show, status: :created, location: @tracing_couple_family }
      else
        format.html { render :new }
        format.json { render json: @tracing_couple_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracing_couple_families/1
  # PATCH/PUT /tracing_couple_families/1.json
  def update
    respond_to do |format|
      if @tracing_couple_family.update(tracing_couple_family_params)
        format.html { redirect_to tracing_couple_families_path, notice: 'Tracing couple family was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracing_couple_family }
      else
        format.html { render :edit }
        format.json { render json: @tracing_couple_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracing_couple_families/1
  # DELETE /tracing_couple_families/1.json
  def destroy
    @tracing_couple_family.destroy
    respond_to do |format|
      format.html { redirect_to tracing_couple_families_url, notice: 'Tracing couple family was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracing_couple_family
      @tracing_couple_family = TracingCoupleFamily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracing_couple_family_params
      params.require(:tracing_couple_family).permit(:clinic_history_couple_id, :clinic_history_family_id, :admin_user, :user_id, :description, :attachment, :tracing_type, :tracing_date, :observation, :evolution, :tracing_state, general_files_attributes: [:id, :name, :file,:user_id,:admin_user,:tool_test_id,:_destroy])
    end
end
