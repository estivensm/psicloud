namespace :clinic_history_config do
  desc "Sends the most voted products created yesterday"
  task crear: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
    User.all.each do |user| 

      
            ClinichistoryConfig.create(admin_user: user.admin_user, user_id: user.id, state: "Basico")
            puts user.email
        

    end    
end
  end