namespace :default_fields do
  desc "Sends the most voted products created yesterday"
  task crear: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
    User.all.each do |user| 

      if user.admin_user == user.id
            FieldDefault.create(admin_user: user.admin_user, user_id: user.admin_user,observation_tracing_state: false,evolution_tracing_state: false,description_tracing_state:true)
            puts user.email
      end   

    end    
end
  end