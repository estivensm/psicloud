class ChildGeneralDatesController < ApplicationController
  before_action :set_child_general_date, only: [:show, :edit, :update, :destroy]

  # GET /child_general_dates
  # GET /child_general_dates.json
  def index
    @child_general_dates = ChildGeneralDate.all
  end

  # GET /child_general_dates/1
  # GET /child_general_dates/1.json
  def show
  end

  # GET /child_general_dates/new
  def new
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    @child_general_date = ChildGeneralDate.new
  end

  # GET /child_general_dates/1/edit
  def edit
     @patient = Patient.find(params[:patient_id])
     @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  end

  # POST /child_general_dates
  # POST /child_general_dates.json
  def create
    @child_general_date = ChildGeneralDate.new(child_general_date_params)

    respond_to do |format|
      if @child_general_date.save
        format.html { redirect_to patient_path(@child_general_date.patient_id), notice: 'Child general date was successfully created.' }
        format.json { render :show, status: :created, location: @child_general_date }
      else
        format.html { render :new }
        format.json { render json: @child_general_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /child_general_dates/1
  # PATCH/PUT /child_general_dates/1.json
  def update
    respond_to do |format|
      if @child_general_date.update(child_general_date_params)
        format.html { redirect_to patient_path(@child_general_date.patient_id), notice: 'Child general date was successfully updated.' }
        format.json { render :show, status: :ok, location: @child_general_date }
      else
        format.html { render :edit }
        format.json { render json: @child_general_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /child_general_dates/1
  # DELETE /child_general_dates/1.json
  def destroy
    @child_general_date.destroy
    respond_to do |format|
      format.html { redirect_to child_general_dates_url, notice: 'Child general date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child_general_date
      @child_general_date = ChildGeneralDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_general_date_params
      params.require(:child_general_date).permit(:father_name, :father_age, :father_birthday, :father_job, :father_addictions, :father_relationship, :mother_name, :mother_age, :mother_birthday, :mother_job, :mother_addictions,:mother_relationship, :parents_realationship, :reasons_relationship, :parents_reaction, :patient_id, :admin_user, :user_id, :account_id, child_brothers_attributes: [:id, :name, :sexo, :edad,:birthdate,:relationship, :observations, :child_general_date_id, :_destroy])
    end
end
