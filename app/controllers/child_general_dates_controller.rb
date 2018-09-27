class ChildGeneralDatesController < ApplicationController
    before_action :authenticate_user!
  before_action :set_child_general_date, only: [:show, :edit, :update, :destroy]
  layout 'admin_patient'
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
    @patient = Patient.find(params[:patient_id])
    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    respond_to do |format|
      if @child_general_date.save
        format.html { redirect_to edit_patient_clinic_history_personal_history_path(@clinic_history.patient_id,@clinic_history.id,@clinic_history.personal_history.id), notice: 'Child general date was successfully created.' }
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
    @patient = Patient.find(params[:patient_id])
                     

    @clinic_history = ClinicHistory.find(params[:clinic_history_id])
    if @clinic_history.first_child_state != true && @clinic_history.child_first_created_at == nil

                  @clinic_history.child_first_created_at = Date.today
                  @clinic_history.first_child_state = false
                  @clinic_history.save
                  

         end 
    respond_to do |format|
      if @child_general_date.update(child_general_date_params)



      Field.where(admin_user: current_user.admin_user).where(state: true).where(form: "Historia Familiar").order(id: :asc).each do |field|
                  
                 if !CreteField.where(clinic_history_id: @clinic_history.id).where(field_id: field.id).any?
                  CreteField.create(content: params[:"#{field.name}"], user_id: current_user.id, admin_user:current_user.id, field_id: field.id, clinic_history_id: @clinic_history.id, child_general_date_id: @child_general_date.id)
                 else
                   CreteField.where(clinic_history_id: @clinic_history.id).where(field_id: field.id).last.update(content: params[:"#{field.name}"])

                 end


        end




          
        format.html { 
        
             if @clinic_history.child_history
          
          redirect_to edit_patient_clinic_history_personal_history_path(@clinic_history.patient_id,@clinic_history.id,@clinic_history.personal_history.id), notice: 'Child general date was successfully created.' 
          
          else

          redirect_to  patient_clinic_history_tool_tests_path(@clinic_history.patient_id,@clinic_history.id)  , notice: 'Clinic history was successfully created.' 
        

          end

        }
                      

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



  def child_get
     
     id = params[:id]
     @child = Child.find(id)

     render plain: "#{@child.genero},#{id},#{@child.relationship}"

  end



  def brother_get


     id = params[:id]
     @brother = ChildBrother.find(id)

     render plain: "#{@brother.sexo},#{id},#{@brother.relationship}"
    
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child_general_date
      @child_general_date = ChildGeneralDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_general_date_params
      params.require(:child_general_date).permit(:father_name, :father_age, :father_birthday, :father_job, :father_addictions, :father_relationship, :mother_name, :mother_age, :mother_birthday, :mother_job, :mother_addictions,:mother_relationship, :parents_realationship, :reasons_relationship, :parents_reaction, :patient_id, :admin_user, :user_id, :account_id, child_brothers_attributes: [:id, :name, :sexo, :edad,:birthdate,:relationship, :observations, :child_general_date_id, :_destroy], children_attributes:[:id, :name, :genero, :age, :relationship ,:observations, :child_general_date_id, :state, :_destroy])
    end
end
