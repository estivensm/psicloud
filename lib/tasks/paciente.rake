namespace :pacientes do
  desc "Sends the most voted products created yesterday"
  task contador: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        

       puts Patient.where('age > ?', ENV['admin_user']).count 
        
end
  end