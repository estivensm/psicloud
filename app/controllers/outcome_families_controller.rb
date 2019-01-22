class OutcomeFamiliesController < ApplicationController
  before_action :set_outcome_family, only: [:show, :edit, :update, :destroy]
  before_action :set_history_family
  layout "admin_clinic_history_family"

  # GET /outcome_families
  # GET /outcome_families.json
  def index
    @outcome_families = OutcomeFamily.all.paginate(page: params[:page],:per_page => 20)
  end

  # GET /outcome_families/1
  # GET /outcome_families/1.json
  def show
  end

  # GET /outcome_families/new
  def new
    @outcome_family = OutcomeFamily.new
  end

  # GET /outcome_families/1/edit
  def edit
  end

  # POST /outcome_families
  # POST /outcome_families.json
  def create
    @outcome_family = OutcomeFamily.new(outcome_family_params)

    respond_to do |format|
      if @outcome_family.save
        format.html { redirect_to clinic_history_family_path(@clinic_history_family.id), notice: 'Outcome family was successfully created.' }
        format.json { render :show, status: :created, location: @outcome_family }
      else
        format.html { render :new }
        format.json { render json: @outcome_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outcome_families/1
  # PATCH/PUT /outcome_families/1.json
  def update
    respond_to do |format|
      if @outcome_family.update(outcome_family_params)
        format.html { redirect_to clinic_history_family_path(@clinic_history_family.id), notice: 'Outcome family was successfully updated.' }
        format.json { render :show, status: :ok, location: @outcome_family }
      else
        format.html { render :edit }
        format.json { render json: @outcome_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outcome_families/1
  # DELETE /outcome_families/1.json
  def destroy
    @outcome_family.destroy
    respond_to do |format|
      format.html { redirect_to outcome_families_url, notice: 'Outcome family was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outcome_family
      @outcome_family = OutcomeFamily.find(params[:id])
    end

    def set_history_family
      @clinic_history_family = ClinicHistoryFamily.find(params[:clinic_history_family_id])
      @outcome_family = @clinic_history_family.outcome_families.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outcome_family_params
      params.require(:outcome_family).permit(:clinic_history_family_id, :diagnostic_description, :therapeutic_goal, :type_of_treatment, :diagnostic_ids => [] , :first_diagnostico_ids => [])
    end
end
