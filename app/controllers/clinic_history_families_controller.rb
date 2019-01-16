class ClinicHistoryFamiliesController < ApplicationController
  before_action :set_clinic_history_family, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "admin", only: [:index, :new]
  # GET /clinic_history_families
  # GET /clinic_history_families.json
  def index
    @clinic_history_families = ClinicHistoryFamily.all.paginate(page: params[:page],:per_page => 10)
  end

  # GET /clinic_history_families/1
  # GET /clinic_history_families/1.json
  def show

         render :layout => "admin_clinic_history_family"

  end

  def paciente
   

    patients =  params[:id].split(",")
    
    array = []

    patients.each do |p|
      
           array <<  Patient.find(p)
    end
 
    render json: array
  end

  # GET /clinic_history_families/new
  def new
    @clinic_history_family = ClinicHistoryFamily.new
  end

  # GET /clinic_history_families/1/edit
  def edit
         render :layout => "admin_clinic_history_family"

  end

  # POST /clinic_history_families
  # POST /clinic_history_families.json
  def create
    @clinic_history_family = ClinicHistoryFamily.new(clinic_history_family_params)

    respond_to do |format|
      if @clinic_history_family.save
        format.html { redirect_to @clinic_history_family, notice: 'Clinic history family was successfully created.' }
        format.json { render :show, status: :created, location: @clinic_history_family }
      else
        format.html { render :new }
        format.json { render json: @clinic_history_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinic_history_families/1
  # PATCH/PUT /clinic_history_families/1.json
  def update
    respond_to do |format|
      if @clinic_history_family.update(clinic_history_family_params)
        format.html { redirect_to @clinic_history_family, notice: 'Clinic history family was successfully updated.' }
        format.json { render :show, status: :ok, location: @clinic_history_family }
      else
        format.html { render :edit }
        format.json { render json: @clinic_history_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinic_history_families/1
  # DELETE /clinic_history_families/1.json
  def destroy
    @clinic_history_family.destroy
    respond_to do |format|
      format.html { redirect_to clinic_history_families_url, notice: 'Clinic history family was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic_history_family
      @clinic_history_family = ClinicHistoryFamily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_history_family_params
      params.require(:clinic_history_family).permit(:reason_consultation, :antecedent_problem, :family_problem, :patient_ids => [], family_group_attributes: [:id, :name, :last_name, :document_number, :age, :sex, :civil_status, :occupation, :relationship, :_destroy])
    end
end
