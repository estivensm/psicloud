namespace :view do
  desc "Sends the most voted products created yesterday"
  task empresas: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
        Patient.all.each do |patient|
                puts patient.first_name
                
            
        end    
    

end
  end