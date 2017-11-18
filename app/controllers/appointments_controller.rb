class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]


  # GET /appointments
  # GET /appointments.json
 
  respond_to :json
  def get_appointments
    @appointment = Appointment.where( user_id: current_user.id)
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
    @appointments = @patient.appointments.page(params[:page]).per_page(8)
  end

  def citas
    
    @appointments = Appointment.where(user_id: current_user.id).page(params[:page]).per_page(8)
    
  end


  # GET /appointments/1
  # GET /appointments/1.json
  def show
  

    client = Google::APIClient.new
      client.authorization.access_token = current_user.token
      service = client.discovered_api('calendar', 'v3')

      result = client.execute(:api_method => service.events.get, :parameters => {'calendarId' => 'alejovelez10@gmail.com', 'eventId' => @appointment.google_event_id } )

      event = result.data

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
    @cita_con = current_user.names
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
            'summary' => @cita_con,
            'description' => @appointment.observations,
            'location' => @appointment.place,
            'start' => { 'dateTime' => startdate },
            'end' => {'dateTime' => enddate  },
            'attendees' => [ { "email" => @patient.email } ] }

            client = Google::APIClient.new
            client.authorization.refresh_token = current_user.refresh_token
            client.authorization.access_token = current_user.token
            service = client.discovered_api('calendar', 'v3')
            
            @set_event = client.execute(:api_method => service.events.insert,
                                    :parameters => {'calendarId' => current_user.email, 'sendNotifications' => true},
                                    :body => JSON.dump(@event),
                                    :headers => {'Content-Type' => 'application/json'})
           @appointment.google_event_id = @set_event.data.id
           @appointment.save

    end




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
        format.html { redirect_to patient_appointments_path(@patient.id), notice: 'Appointment was successfully updated.' }
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

    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to patient_appointments_path(@patient.id), notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
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
      params.require(:appointment).permit(:start_datetime, :end_datetime, :observations, :place, :patient_id, :admin_user, :user_id, :attachment, :duration, :name, :state)
    end
end
