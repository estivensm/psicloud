class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy, :send_history]
  before_action :authenticate_user!
  #before_action :is_account, only: [:show, :edit, :update, :destroy, :send_history]


 #def  is_account
   
   #if @patient.admin_user != current_user.admin_user
       
       #redirect_to patients_path
  
   #end 
   
 #end
  
  # GET /patients
  # GET /patients.json
  def index
    puts request.ip
    @ip =  request.env['REMOTE_ADDR']
    @hpcs = Hpc.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @agreements = Agreement.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @patients = Patient.where(user_id: current_user.id).activos.searchp(params[:search]).paginate(page: params[:page],:per_page => 20)
    @patientspdf = Patient.where(user_id: current_user.id)
    @route = patients_path
  
    @type = ""
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Pacientes",
        header: { right: '[page] of [topage]' },
        :template => 'patients/pdfs/patients.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
                    top: 10
                     },
        :header => {
                  :spacing => 5,
                  :html => {
                    
                  },

                  },
                  :footer => {
                    :spacing => 5,
                  :html => {
                     
                  }
               },
        :show_as_html => params[:debug].present?
      end
    end
  end

  def inactive

    puts request.ip
    @ip =  request.env['REMOTE_ADDR']
    @hpcs = Hpc.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @agreements = Agreement.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @patients = Patient.where(user_id: current_user.id).inactivos.searchp(params[:search]).paginate(page: params[:page],:per_page => 20)
    @patientspdf = Patient.where(user_id: current_user.id)
    @route = patients_path
    
    render 'index'
  end

  def csv
    @patients = Patient.where(admin_user: current_user.admin_user).where(user_id: current_user.id)
    respond_to do |format|
       format.csv { send_data @patients.to_csv, filename: "patients.csv" }
      
  end

end

  def csv_all
    @patients = Patient.where(admin_user: current_user.admin_user)
    respond_to do |format|
       format.csv { send_data @patients.to_csv, filename: "patients.csv" }
      
  end

  end

  def all_patients
    
   if params[:search]
    @patients = Patient.where(admin_user: current_user.admin_user).searchp1(params[:search], params[:search1]).paginate(page: params[:page],:per_page => 30)
  else 
    @patients = Patient.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 30)
  end


    @patientspdf = Patient.where(admin_user: current_user.admin_user)
    @route = all_patients_path
    @type = "TODOS LOS "
  
     respond_to do |format|
      format.html do 
         
      end
      format.pdf do
        render :pdf => "Pacientes",
        header: { right: '[page] of [topage]' },
        :template => 'patients/pdfs/patients.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
                    top: 10
                     },
        :header => {
                  :spacing => 5,
                  :html => {
                     
                  },

                  },
                  :footer => {
                    :spacing => 5,
                  :html => {
                     
                  }
               },
        :show_as_html => params[:debug].present?
      end
    end
  
  
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
      
        @field_default = FieldDefault.where(admin_user: current_user.admin_user).first
        @created_formats = CreatedFormat.where(admin_user: current_user.admin_user).order(created_at: :desc)
        @hpcs = Hpc.where(admin_user: current_user.admin_user).order(created_at: :desc)
        @agreements = Agreement.where(admin_user: current_user.admin_user).order(created_at: :desc)
        @clinic_history = @patient.clinic_histories.first
        if @patient.clinic_histories.first != nil
        @last_tracing = @patient.clinic_histories.first.tracings.last
        else
          @last_tracing = nil
        end
        @appointment_l = @patient.appointments.where(state: "Vigente").order(start_datetime: :desc).last
         
        render :layout => 'admin_patient'   
      
  end

  # GET /patients/new
  def new
    @users = User.where(admin_user: current_user.admin_user)
    @hpcs = Hpc.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @agreements = Agreement.where(admin_user: current_user.admin_user).order(created_at: :desc)
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
   @users = User.all
   @agreements = Agreement.where(admin_user: current_user.admin_user).order(created_at: :desc)
   @hpcs = Hpc.where(admin_user: current_user.admin_user).order(created_at: :desc)
  end



  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    datau = @patient.data
    @patient.data = ""
    @patient.avatar = convert_data_uri_to_upload(datau)
    age = @patient.age = Date.today.year - @patient.birth_date.year
    amonth = Date.today.month
    bmonth = @patient.birth_date.month
    aday = Date.today.day
    bday = @patient.birth_date.day
    if amonth < bmonth
      @patient.age = age -1  
      @patient.birthdate_month = bmonth - amonth + 12
      @patient.birthdate_day = aday
    elsif amonth == bmonth
        if aday < bday
          @patient.age = age -1
            @patient.birthdate_month = 11
            @patient.birthdate_day = aday
        else
          @patient.age = age
          @patient.birthdate_month = 0
          @patient.birthdate_day = aday - bday
        end    
    else
      @patient.age = age
      @patient.birthdate_month = amonth -bmonth
      @patient.birthdate_day = aday
    end    
    @patient.state = true



        

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
        age = @patient.age = Date.today.year - @patient.birth_date.year
    amonth = Date.today.month
    bmonth = @patient.birth_date.month
    aday = Date.today.day
    bday = @patient.birth_date.day
    if amonth < bmonth
      @patient.age = age -1  
      @patient.birthdate_month = 12 - bmonth - amonth  
      @patient.birthdate_day = aday
    elsif amonth == bmonth
      "aquiiiiiiiiiiiiiiiiiiii"
        if aday < bday
          "1111111"
          @patient.age = age -1
            @patient.birthdate_month = 11
            @patient.birthdate_day = aday
        else
      "2222222222222"
          @patient.age = age
          @patient.birthdate_month = 0
          @patient.birthdate_day = aday - bday
        end    
    else
      @patient.age = age
      @patient.birthdate_month = amonth -bmonth
      @patient.birthdate_day = aday
    end  
      
      if @patient.clinic_histories.count != 0
        if @patient.age < 14
           @a = @patient.clinic_histories.first
           @a.child_history = true
           @a.save
        else
        
           @a = @patient.clinic_histories.first
           @a.child_history = false
           @a.save
        end

       end 
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
        render :pdf => "Consentimiento_Informado",
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
                     :template => 'layouts/pdf_footer_ci.html.erb'
                  }
               },
        :show_as_html => params[:debug].present?
      end
    end
    
  end



def consentimiento_informado_adolescentes

@patient = Patient.find(params[:patient_id])
      respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Consentimiento_Informado",
        header: { right: '[page] of [topage]' },
        :template => 'patients/pdfs/consentimiento_informado_adolescentes.pdf.erb',
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
                     :template => 'layouts/pdf_footer_cim.html.erb'
                  }
               },
        :show_as_html => params[:debug].present?
      end
    end
    
  end

def formato
  @patient = Patient.find(params[:patient_id])
  @created_format = CreatedFormat.find(params[:id])
      respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Formatos",
        :template => 'patients/pdfs/formatos.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
                    top: 15
                     },

        :show_as_html => params[:debug].present?
    end
  end  
end


def consentimiento_informado_menores
@patient = Patient.find(params[:patient_id])
      respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Consentimiento_Informado",
        header: { right: '[page] of [topage]' },
        :template => 'patients/pdfs/consentimiento_informado_menores.pdf.erb',
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
                     :template => 'layouts/pdf_footer_cim.html.erb'
                  }
               },
        :show_as_html => params[:debug].present?
      end
    end
    
  end

    def consentimiento_creado
      
      @patient = Patient.find(params[:patient_id])
   
      current_user.consents.each do  |consent|
          
          if @patient.age >= consent.first_age  &&  @patient.age < consent.second_age 
          #(consent.first_age..consent.second_age).each do |i|
           #   puts i
            #  if i == @patient.age
             #   puts "entreeeeeeeeeeeeeee"
                   @consent = consent 
              #end  
           end 

      end  
      respond_to do |format|
      format.html 
      format.pdf do
        render :pdf => "Consentimiento_Informado",
        header: { right: '[page] of [topage]' },
        :template => 'patients/pdfs/consentimiento_creado.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
                    top: 15
                     },
        :header => {
                  :spacing => 5,
                  :html => {
                     :template => 'layouts/pdf_header_creado.html.erb'
                  },

                  },
                  :footer => {
                    :spacing => 5,
                  :html => {
                     :template => 'layouts/pdf_footer_creado.html.erb'
                  }
               },
        :show_as_html => params[:debug].present?
      end
    end
    
  end

  def create_hpc
  
   a =  Hpc.new(name:params[:name],user_id:current_user.id, admin_user:current_user.admin_user)
   a.save
   @hpcs = Hpc.where(admin_user: current_user.admin_user).order(created_at: :desc)

end

 def create_agreement
  
   a =  Agreement.new(name:params[:name],user_id:current_user.id, admin_user:current_user.admin_user)
   a.save
   @agreements = Agreement.where(admin_user: current_user.admin_user).order(created_at: :desc)

 end




  def send_history

      
      current_user_mailer = current_user
      @patient = Patient.find(params[:id])
      SendHistoryMailer.send_mailer(@patient,params[:email], params[:asunto] ,params[:descripcion],current_user_mailer).deliver
      redirect_to patient_path(@patient.id) , notice: 'La Historia Clinica se envio correctamente' 
  end 

  def change_state
    
    params[:value] == "true" ? val = true : val = false 
    Patient.find(params[:id]).update(state: val)
  
  end



  def crear_firma_paciente

    @patient = Patient.find(params[:patient_id])
   
   # if !params[:firma_paciente].blank?
      if @patient.update(firma_paciente: params[:firma_paciente]) 
        
        @state = true

      
      end 
    #end 
    
  end

  def crear_firma_padre

    @patient = Patient.find(params[:patient_id])
   
   # if !params[:firma_paciente].blank?
      if @patient.update(firma_padre: params[:firma_padre]) 
        
        @state = true

      
      end 
    #end 
    
  end

def crear_firma_madre

    @patient = Patient.find(params[:patient_id])
   
   # if !params[:firma_paciente].blank?
      if @patient.update(firma_madre: params[:firma_madre]) 
        
        @state = true

      
      end 
    #end 
    
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :second_name, :first_last_name, :second_last_name, :birth_date, :age, :document_type, :document, :occupation, :profession, :phone, :address, :email, :contact_name, :contact_phone, :gender, :contact_relationship, :civil_status, :blood_type,:ethnic_group, :user_id, :admin_user,:hpc_id,:count,:agreement_id,:avatar,:city,:movil,:data,:birthdate_month,:birthdate_day,:school_grade, :children, :number_children )
    end
end




