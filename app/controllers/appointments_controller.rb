class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
 
  include ApplicationHelper

  # GET /appointments
  # GET /appointments.json
 
  respond_to :json
  def get_appointments
    
    @appointment = Appointment.where( admin_user: current_user.admin_user).where( user_id: current_user.id)
    events = []
    @appointment.each do |task|
      
        @color = "#17c1ca"

        events << {:id => task.id, :title => "#{task.patient.first_name} #{task.patient.first_last_name} ", :start => "#{task.start_datetime.to_date}" , :color => "#{@color}", :url =>"patients/#{task.patient_id}"}
    end
    puts events.to_json.to_s
      render plain: events.to_json.to_s
  end 


  respond_to :json


  def get_appointments_admin
    @appointment = Appointment.where( admin_user: current_user.admin_user)
    events = []
    @appointment.each do |task|
      
        @color = "#17c1ca"

        events << {:id => task.id, :title => "#{task.patient.first_name} #{task.patient.first_last_name} ", :start => "#{task.start_datetime.to_date}" , :color => "#{@color}", :url =>"patients/#{task.patient_id}"}
    end
    puts events.to_json.to_s
      render plain: events.to_json.to_s
  end 





  def index
      @patient = Patient.find(params[:patient_id])
      @appointments = @patient.appointments.page(params[:page]).per_page(20).order(start_datetime: :desc)
      @clinic_history = @patient.clinic_histories.first
      @appointments.where(state: "Vigente").or(@appointments.where(state:"Vencida")).each do |app|
          
          if app.start_datetime < Time.now()
                  
              app.state = "Vencida"
              app.save
          
          else 
            app.state = "Vigente"
            app.save
          end     
        
      end  



      @appointment_abiertas = @appointments.where(state: "Vigente").or(@appointments.where(state:"Vencida"))
      @appointment_cerradas = @appointments.where("state != ?", "Vigente").where("state != ?", "Vencida")
      @appointments_canceladas = @appointments.where(state: "Cancelada")
      @appointments_realizadas = @appointments.where(state: "Realizada")
      @appointments_no_asistio = @appointments.where(state: "Realizada")


      render :layout  => 'admin_patient'
  end


  def citas
    
    @appointments = Appointment.where(user_id: current_user.id).page(params[:page]).per_page(20)
    
  end

  def citas_admin
    
    @appointments = Appointment.where(admin_user: current_user.admin_user).page(params[:page]).per_page(20)
    
  end


  # GET /appointments/1
  # GET /appointments/1.json
  def show
  


    #client = Google::APIClient.new
      #client.authorization.access_token = current_user.token
      #service = client.discovered_api('calendar', 'v3')

      #result = client.execute(:api_method => service.events.get, :parameters => {'calendarId' => 'alejovelez10@gmail.com', 'eventId' => @appointment.google_event_id } )

      #event = result.data

  end

  # GET /appointments/new
  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @patient = Patient.find(params[:patient_id])
    respond_to do |format|
      if @appointment.save
       
      
    




       if current_user.token != nil

              t = @appointment.start_datetime
              t.min < 10 ? min = "0" : min = ""
              t.hour < 10 ? hora = "0" : hora = ""
              startdate = "#{t.year}-#{t.month}-#{t.day}T#{hora}#{t.hour}:#{min}#{t.min}:00-05:00"
              te = @appointment.end_datetime
              te.min < 10 ? mint = "0" : mint = ""
              te.hour < 10 ? horat = "0" : horat = ""
              enddate = "#{te.year}-#{te.month}-#{te.day}T#{horat}#{te.hour}:#{mint}#{te.min}:00-05:00"
              @event = {
            'summary' => 'Cita con ' + @patient.first_name,
            'description' => @appointment.observations,
            'location' => @appointment.place,
            'start' => { 'dateTime' => startdate },
            'end' => {'dateTime' => enddate  },
            'attendees' => [ { "email" => @patient.email } ] }

            client = Google::APIClient.new
            client.authorization.refresh_token = current_user.refresh_token_if_expired
            client.authorization.access_token = current_user.token
            service = client.discovered_api('calendar', 'v3')
            
            @set_event = client.execute(:api_method => service.events.insert,
                                    :parameters => {'calendarId' => current_user.email, 'sendNotifications' => true},
                                    :body => JSON.dump(@event),
                                    :headers => {'Content-Type' => 'application/json'})
           @appointment.google_event_id = @set_event.data.id
           @appointment.save

    end

       CitaMailer.programacion_cita(@patient,@appointment).deliver


        format.html { redirect_to patient_appointments_path(@patient.id), notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    
    respond_to do |format|
      if @appointment.update(appointment_params)
        
         unless @appointment.google_event_id.nil?
      client = Google::APIClient.new
      client.authorization.refresh_token = current_user.refresh_token_if_expired
      client.authorization.access_token = current_user.token
      service = client.discovered_api('calendar', 'v3')

      result = client.execute(:api_method => service.events.get, :parameters => {'calendarId' => current_user.email, 'eventId' => @appointment.google_event_id } )

      event = result.data
 
      t = @appointment.start_datetime
      t.min < 10 ? min = "0" : min = ""
      t.hour < 10 ? hora = "0" : hora = ""
      startdate = "#{t.year}-#{t.month}-#{t.day}T#{hora}#{t.hour}:#{min}#{t.min}:00-05:00"
      te = @appointment.end_datetime
      te.min < 10 ? mint = "0" : mint = ""
      te.hour < 10 ? horat = "0" : horat = ""
      enddate = "#{te.year}-#{te.month}-#{te.day}T#{horat}#{te.hour}:#{mint}#{te.min}:00-05:00"
      


      event.summary = 'Cita con ' + @patient.first_name
      event.start.dateTime = startdate
      event.end.dateTime = enddate
      event.description = @appointment.observations
      event.location = @appointment.place

      result = client.execute(:api_method => service.events.update,
                              :parameters => {'calendarId' => current_user.email, 'eventId' =>  @appointment.google_event_id},
                              :body_object => event,
                              :headers => {'Content-Type' => 'application/json'})
    end
    

        format.html { redirect_to patient_appointments_path(@patient.id), notice: 'La cita se modifico correctamente' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
     unless @appointment.google_event_id.nil?
      client = Google::APIClient.new
      client.authorization.refresh_token = current_user.refresh_token_if_expired
      client.authorization.access_token = current_user.token
      service = client.discovered_api('calendar', 'v3')

      result = client.execute(:api_method => service.events.delete,
                              :parameters => {'calendarId' => current_user.email, 'eventId' => @appointment.google_event_id})
    end
    @appointment.destroy
   
 
    respond_to do |format|
      format.html { redirect_to patient_appointments_path(@patient.id), notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def change_state_appointment
      
      @appointment = Appointment.find(params[:id])
     

      
      if @appointment.update(state: params[:state])
        if Appointment.where(state: "Vigente").order(start_datetime: :desc).last != nil
          @appointment_l = get_date_array(Appointment.where(state: "Vigente").order(start_datetime: :desc).last.start_datetime)
          
          render json: @appointment_l
          puts "siiiiiiiiiiiiiiiii"
         else
          
          render json: {name: 0}
          puts "nooooooooooooooooo"
         end
      end
  end  

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @patient = Patient.find(params[:patient_id])
      @appointment = Appointment.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:start_datetime, :end_datetime, :observations, :place, :patient_id, :admin_user, :user_id, :attachment, :duration, :name, :state,:reason_cancel)
    end
end
