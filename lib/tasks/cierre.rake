namespace :cierre do
  desc "Sends the most voted products created yesterday"
  task historia_clinica: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
       ClinicHistory.all.each do |ch|
          

           if ch.created_at < Date.today() && !ch.first_contact_state
                        
                ch.first_contact_state = true
                ch.save

           end 

         
        if ch.child_first_created_at != nil
           if ch.child_first_created_at < Date.today() && !ch.first_child_state
                        
                ch.first_child_state = true
                ch.save

           end

        end     
        
         if ch.second_child_created_at != nil
           if ch.second_child_created_at < Date.today() && !ch.second_child_state
                        
                ch.second_child_state = true
                ch.save

           end  
         end   
         
         if ch.third_child_created_at != nil
           if ch.third_child_created_at < Date.today() && !ch.third_child_state
                        
                ch.third_child_state = true
                ch.save

           end
         end      

         if ch.four_child_created_at  != nil
           if ch.four_child_created_at < Date.today() && !ch.four_child_state
                        
                ch.four_child_state = true
                ch.save

           end
         end    

          if ch.desenlace_created_at != nil

            if ch.desenlace_created_at < Date.today() && !ch.outcome_state
                        
                ch.outcome_state = true
                ch.save

           end   

          end 


       end
        
    end
  end





#  first_contact_state     :boolean
#  outcome_state           :boolean
#  first_child_state       :boolean
#  second_child_state      :boolean
#  third_child_state       :boolean
#  four_child_state        :boolean