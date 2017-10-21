class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 3)
 
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
      @hs = @patient.clinic_histories.first
        @appointment_l = Appointment.where(state: "Vigente").last
    
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    datau = @patient.data
    @patient.data = ""
    @patient.avatar = convert_data_uri_to_upload(datau)
    @patient.age = Date.today.year - @patient.birth_date.year
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end







  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        datau = @patient.data
        @patient.data = ""
        @patient.avatar = convert_data_uri_to_upload(datau)
        @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def consentimiento_informado
@patient = Patient.find(params[:patient_id])
      respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "hola",
        header: { right: '[page] of [topage]' },
        :template => 'patients/pdfs/consentimiento_informado.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
                    top: 15
                     },
        :header => {
                  :spacing => 5,
                  :html => {
                     :template => 'layouts/pdf_header.html'
                  },

                  },
                  :footer => {
                    :spacing => 5,
                  :html => {
                     :template => 'layouts/pdf_footer.html.erb'
                  }
               },
        :show_as_html => params[:debug].present?
      end
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :second_name, :first_last_name, :second_last_name, :birth_date, :age, :document_type, :document, :occupation, :profession, :phone, :address, :email, :contact_name, :contact_phone, :gender, :contact_relationship, :civil_status, :blood_type,:ethnic_group, :user_id, :admin_user,:hpc_id,:count,:agreement_id,:avatar,:city,:movil,:data )
    end
end
