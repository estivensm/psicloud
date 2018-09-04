class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  layout 'admin_patient'
  # GET /tasks
  # GET /tasks.json
  def index
    @patient = Patient.find(params[:patient_id])
    @tasks = @patient.tasks.abiertas.paginate(page: params[:page],:per_page => 10).order(fecha_compromiso: :desc)
    @tasks_cerradas = @patient.tasks.cerradas.paginate(page: params[:page],:per_page => 10).order(fecha_compromiso: :desc)
    @clinic_history = @patient.clinic_histories.first
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    start = Time.now()
    mes = start.month < 10 ?  "0" : ""
    dia = start.day < 12 ?  "0" : ""
    hora = start.hour < 12 ?  "0" : ""
    minuto = start.min < 12 ?  "0" : ""   


    @start_datetime = start.year.to_s + "/" + mes +start.month.to_s +  "/" + dia +start.day.to_s + " " + hora + start.hour.to_s + ":" +  minuto + start.min.to_s  
    
    @patient = Patient.find(params[:patient_id])
    @task = Task.new
    @appointments = @patient.appointments.where(state: "Vigente").order(start_datetime: :desc)
  end

  # GET /tasks/1/edit
  def edit
     start = @task.fecha_compromiso
    
    mes = start.month < 10 ?  "0" : ""
    dia = start.day < 10 ?  "0" : ""



    @start_datetime = start.year.to_s + "/" + mes +start.month.to_s +  "/" + dia +start.day.to_s 
    
    @patient = Patient.find(params[:patient_id])
    @appointments = @patient.appointments.order(start_datetime: :desc)
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @patient = Patient.find(params[:patient_id])

   
      if @task.save

        #@appointment = Appointment.find(@task.appointment_id)
        #@task.fecha_compromiso = @appointment.start_datetime.to_date
        @task.save
        @tasks = @patient.tasks.abiertas.order(fecha_compromiso: :asc)
 
      end
   
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @patient = Patient.find(params[:patient_id])

      if @task.update(task_params)
        #@appointment = Appointment.find(@task.appointment_id)
        #@task.fecha_compromiso = @appointment.start_datetime.to_date
        @task.save
        @tasks = @patient.tasks.abiertas.order(fecha_compromiso: :asc)
      end

  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @patient = Patient.find(params[:patient_id])
    @taskd = @task
    @task.destroy

 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @patient = Patient.find(params[:patient_id])
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id, :admin_user, :patient_id, :description, :fecha_compromiso, :appointment_id, :estado, :fecha_entrega, :cumplimiento, :file)
    end
end
