class HomeController < ApplicationController
	 before_action :authenticate_user!
  def index

    
    
    #response    = RestClient.post "https://accounts.google.com/o/oauth2/token", :grant_type => 'refresh_token', :refresh_token => current_user.refresh_token, :client_id => "537103906622-4n2q9h81kuucu4vppbg85lqahda3vohb.apps.googleusercontent.com", :client_secret => "bkk9SygmN8ywbNB2tdFdL1VN" 
    #refreshhash = JSON.parse(response.body)
    puts "gogleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
    puts request.domain


    url = URI("https://accounts.google.com/o/oauth2/token")
    hola = Net::HTTP.post_form(url, { 'refresh_token' => current_user.refresh_token,
      'client_id'     => "537103906622-4n2q9h81kuucu4vppbg85lqahda3vohb.apps.googleusercontent.com",
      'client_secret' => "bkk9SygmN8ywbNB2tdFdL1VN",
      'grant_type'    => 'refresh_token'})


    data = JSON.parse(hola.body)
    puts data

    @pacientes_count = Patient.where(user_id: current_user.id)
    @clinic_history = ClinicHistory.where(user_id: current_user.id).where(child_history: false).where('extract(year  from created_date) = ?', (Time.now.year))
    @clinic_history1 = ClinicHistory.where(user_id: current_user.id).where('extract(year  from created_date) = ?', (Time.now.year))
    
    @mes = Array.new
    @mes1 = Array.new
    12.times.each do |mes|
    	
        @mes <<  @clinic_history.where('extract(month  from created_date) = ?', (mes+ 1)).count
        @mes1 <<  @clinic_history1.where('extract(month  from created_date) = ?', (mes+ 1)).count

    end    

    
     

    @citas = Appointment.where(user_id: current_user.id)
  	 if params[:search].present?
        @pacientes = Patient.where(user_id: current_user.id).search(params[:search]).page(params[:page]).per_page(12)
    end


    if request.xhr?
      render partial: 'personas', status: 200
    end

  end


   def loader
    redirect_to "https://psicloud.herokuapp.com/loaderio-a37049370b15266d36ffe4514aeca803.txt"
     
   end
end
