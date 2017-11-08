class ClinicHistoriesController < ApplicationController
  before_action :set_clinic_history, only: [:show, :edit, :update, :destroy]

  # GET /clinic_histories
  # GET /clinic_histories.json
  def index
    @clinic_histories = ClinicHistory.all
  end

  # GET /clinic_histories/1
  # GET /clinic_histories/1.json
  def show
  @patient = Patient.find(params[:patient_id])
 
  respond_to do |format|
      format.html
      format.pdf do
        render :pdf => @clinic_history.patient.first_name + @clinic_history.patient.first_last_name,
        header: { right: '[page] of [topage]' },
        :template => 'clinic_histories/pdfs/clinic_history.pdf.erb',
        :layout => 'pdf.html.erb',
        margin: {
                    top: 0
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
  end

  # GET /clinic_histories/1/edit
  def edit
    @patient = Patient.find(params[:patient_id])
  end

  # POST /clinic_histories
  # POST /clinic_histories.json
  def create
    @clinic_history = ClinicHistory.new(clinic_history_params)
    @patient = Patient.find(params[:patient_id])
    respond_to do |format|
      if @clinic_history.save
        if @patient.age < 14
          @clinic_history.child_history = true
          @clinic_history.save
        end
        format.html { redirect_to  patient_clinic_history_tool_tests_path(@clinic_history.patient_id,@clinic_history.id), notice: 'Clinic history was successfully created.' }
        format.json { render :show, status: :created, location: @clinic_history }
      else
        format.html { render :new }
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
        format.html { redirect_to patient_clinic_history_tool_tests_path(@clinic_history.patient_id,@clinic_history.id), notice: 'Clinic history was successfully updated.' }
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
      

          if @history.update(therapeutic_goal:params[:therapeutic_goal],type_of_treatment:params[:type_of_treatment], diagnostic_hypothesis: params[:diagnostic_hypothesis])
              @history.diagnostics.destroy_all
            if params[:diagnostic_ids] != nil  
              params[:diagnostic_ids].each do |diag|
                
                @history.diagnostics << Diagnostic.find(diag)
                
              end
              
          
              

            end


               redirect_to patient_step3_path(@clinic_history.patient_id,@history.id)
          end
      
  end
  def step3

      @clinic_history = ClinicHistory.find(params[:id])
       @patient = Patient.find(@clinic_history.patient_id)
         
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic_history

      @clinic_history = ClinicHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_history_params
      params.require(:clinic_history).permit(:clinic_history_id, :count, :consultation_reason, :actual_state, :diagnostic_hypothesis, :therapeutic_goal, :quantity_appointment, :frequency_appointment, :user_id, :admin_user, :patient_id, :type_of_treatment, :description_appointment, :family_dinamic,backgrounds_attributes: [:id, :name, :description, :attachment,:type_background,:clase,:admin_user,:user_id, :patient_id ,:clinic_history_id, :_destroy],personal_backgrounds_attributes: [:id, :name, :description, :attachement,:type_background,:admin_user,:user_id, :patient_id ,:clinic_history_id, :_destroy])
    end
end
