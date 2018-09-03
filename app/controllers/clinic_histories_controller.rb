class ClinicHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic_history, only: [:show, :edit, :update, :destroy]
   

  # GET /clinic_histories
  # GET /clinic_histories.json
  def index
    @clinic_histories = ClinicHistory.all
    render :layout => 'admin_patient'
  end

  # GET /clinic_histories/1
  # GET /clinic_histories/1.json
  def show
  @field_default = FieldDefault.where(admin_user: current_user.admin_user).first
  @patient = Patient.find(params[:patient_id])
  @fchild = @clinic_history.child_general_date
  if @clinic_history.child_history
  @field_default = FieldDefault.where(admin_user: current_user.admin_user).first
  @schild = @clinic_history.personal_history
  @tchild = @clinic_history.two_child_history
  @fochild = @clinic_history.three_child_history 
end
   @pdf = "basico"
  respond_to do |format|
      format.html
      format.pdf do
        render :pdf => @clinic_history.patient.first_name + @clinic_history.patient.first_last_name,
        header: { right: '[page] of [topage]' },
        :template => 'clinic_histories/pdfs/clinic_history.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
                    top: 10
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
                     :template => 'layouts/pdf_footer.html.erb',
                     :right => 'Page [page] of [topage]',
                     :font_size => 7
                  }
               },
        :show_as_html => params[:debug].present?
      end
    end
  end

  def pdf_completo
  @clinic_history = ClinicHistory.find(params[:clinic_history_id])
  @patient = Patient.find(params[:patient_id])
  @field_default = FieldDefault.where(admin_user: current_user.admin_user).first
  @fchild = @clinic_history.child_general_date
  if @clinic_history.child_history
 
  @schild = @clinic_history.personal_history
  @tchild = @clinic_history.two_child_history
  @fochild = @clinic_history.three_child_history
 
end
 @pdf = "completo"
  respond_to do |format|
     
      format.pdf do
        render :pdf => @clinic_history.patient.first_name + @clinic_history.patient.first_last_name,
        header: { right: '[page] of [topage]' },
        :template => 'clinic_histories/pdfs/clinic_history.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
                    top: 10
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




  

  # GET /clinic_histories/new
  def new
      @patient = Patient.find(params[:patient_id])
      @clinic_history = ClinicHistory.new
      render :layout => 'admin_patient'

  end

  # GET /clinic_histories/1/edit
  def edit
    @patient = Patient.find(params[:patient_id])
    render :layout => 'admin_patient'
  end

  # POST /clinic_histories
  # POST /clinic_histories.json
  def create
    @clinic_history = ClinicHistory.new(clinic_history_params)
    @patient = Patient.find(params[:patient_id])
    respond_to do |format|
      if @clinic_history.save
      
      num = @patient.clinic_histories.maximum(:count)
      if num != nil
      num = num + 1

    else
        num = 1
    end
    code= "#{@patient.document}-#{num}" 
    @clinic_history.codigo = code
    @clinic_history.count = num


       
        if @patient.age < 14
          @clinic_history.child_history = true
           @clinic_history.save
        else
        
          @clinic_history.child_history = false
          @clinic_history.save
        end


         Field.where(admin_user: current_user.admin_user).where(state: true).where(form: "Primer Contacto").order(id: :asc).each do |field|
                  
                 
                  CreteField.create(content: params[:"#{field.name}"], user_id: current_user.id, admin_user:current_user.id, field_id: field.id, clinic_history_id: @clinic_history.id)
              


        end





        format.html { 

          if !@clinic_history.child_history
          
          redirect_to  patient_clinic_history_history_tool_tests_path(@clinic_history.patient_id,@clinic_history.id)  , notice: 'Clinic history was successfully created.' 
           
            else
          
          redirect_to  patient_clinic_history_history_tool_tests_path(@clinic_history.patient_id,@clinic_history.id)  , notice: 'Clinic history was successfully created.' 

          
            end
        }
        format.json { render :show, status: :created, location: @clinic_history }
      else 
        format.html { render :new  }
        format.json { render json: @clinic_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinic_histories/1
  # PATCH/PUT /clinic_histories/1.json
  def update
     @patient = Patient.find(params[:patient_id])

    respond_to do |format|
      if @clinic_history.update(clinic_history_params)

        
          Field.where(admin_user: current_user.admin_user).where(state: true).where(form: "Primer Contacto").order(id: :asc).each do |field|
                  
                 if !CreteField.where(clinic_history_id: @clinic_history.id).where(field_id: field.id).any?
                  CreteField.create(content: params[:"#{field.name}"], user_id: current_user.id, admin_user:current_user.id, field_id: field.id, clinic_history_id: @clinic_history.id)
                 else
                   CreteField.where(clinic_history_id: @clinic_history.id).where(field_id: field.id).last.update(content: params[:"#{field.name}"])

                 end


        end

         if @clinic_history.first_contact_state != true && @clinic_history.first_contact_created_at == nil

                  @clinic_history.first_contact_created_at = Date.today
                  @clinic_history.first_contact_state = false
                  @clinic_history.save
         end  


        format.html { 
               if !@clinic_history.child_history && !@clinic_history.child_general_date
          
          redirect_to  patient_clinic_history_tool_tests_path(@clinic_history.patient_id,@clinic_history.id), notice: 'Clinic history was successfully created.' 
           
            elsif !@clinic_history.child_history && @clinic_history.child_general_date
          
          redirect_to  edit_patient_clinic_history_child_general_date_path(@clinic_history.patient_id,@clinic_history.id,@clinic_history.child_general_date.id), notice: 'Clinic history was successfully created.' 
            
            else

              redirect_to  edit_patient_clinic_history_child_general_date_path(@clinic_history.patient_id,@clinic_history.id,@clinic_history.child_general_date.id), notice: 'Clinic history was successfully created.' 


            end
        }
        format.json { render :show, status: :ok, location: @clinic_history }
      else
        format.html { render :edit }
        format.json { render json: @clinic_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinic_histories/1
  # DELETE /clinic_histories/1.json
  def destroy
    @clinic_history.destroy
    respond_to do |format|
      format.html { redirect_to clinic_histories_url, notice: 'Clinic history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def update_step3
      
      @clinic_history = ClinicHistory.find(params[:id])
      @patient = Patient.find(@clinic_history.patient_id)

          if @clinic_history.update(therapeutic_goal:params[:therapeutic_goal],type_of_treatment:params[:type_of_treatment], diagnostic_hypothesis: params[:diagnostic_hypothesis],outcome_state: params[:outcome_state],diagnostico_id: params[:diagnostico_id])
              

              Field.where(admin_user: current_user.admin_user).where(form: "Diagnostico y Tratamiento").order(id: :asc).each do |field|
                  
                 if !CreteField.where(clinic_history_id: @clinic_history.id).where(field_id: field.id).any?
                  CreteField.create(content: params[:"#{field.name}"], user_id: current_user.id, admin_user:current_user.id, field_id: field.id, clinic_history_id: @clinic_history.id)
                 else
                   CreteField.where(clinic_history_id: @clinic_history.id).where(field_id: field.id).last.update(content: params[:"#{field.name}"])

                 end


              end





              if @clinic_history.desenlace_first != true && @clinic_history.desenlace_created_at == nil

                  @clinic_history.desenlace_created_at = Date.today
                  @clinic_history.desenlace_first = false
                  @clinic_history.save
              end  



              @clinic_history.diagnostics.destroy_all
            if params[:diagnostic_ids] != nil  
              params[:diagnostic_ids].each do |diag|
                
                @clinic_history.diagnostics << Diagnostic.find(diag)
                
              end
              
          
              

            end


            @clinic_history.diagnosticos.destroy_all
            if params[:diagnostico_ids] != nil  
              params[:diagnostico_ids].each do |diag|
                
                @clinic_history.diagnosticos << Diagnostico.find(diag)
                
              end
              
          
              

            end

               redirect_to patient_path(@clinic_history.patient_id)

               #redirect_to patient_step3_path(@clinic_history.patient_id,@clinic_history.id)
          end
      
  end
  def step3

      @clinic_history = ClinicHistory.find(params[:id])
       @patient = Patient.find(@clinic_history.patient_id)
         render :layout => 'admin_patient'
      
  end



   def change_fcitas

    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    @clinic_history.update(patient_id: params[:patient_id],frequency_appointment:params[:frequency_appointment],quantity_appointment: params[:quantity_appointment])
    @clinic_history.save
  end



  #Actulizar historia clinica mientras copia
    def actualizar_hc
        
        campo = params[:campo]
        id = params[:id]
        value = params[:value]
        case campo
            when "consultation_reason"
              if ClinicHistory.find(id).update(consultation_reason: value)
                    render plain: "Motivo de Consulta se actulizo correctamente"
              else
                    render plain: "No Actualizo"
              end      
            when "actual_state"
              if ClinicHistory.find(id).update(actual_state: value)
                    render plain: "Estado Actual se actulizo correctamente"
            
              else
                    render plain: "No Actualizo"
              end   
            when "family_dinamic"
              if ClinicHistory.find(id).update(family_dinamic: value)
                    render plain: "Dinamica Familiar se actulizo correctamentee"
            
              else
                    render plain: "No Actualizo"
              end       
            else
              puts "NADA"
        end
        
        


       

    end  



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic_history

      @clinic_history = ClinicHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_history_params

      params.require(:clinic_history).permit!
    end
end
