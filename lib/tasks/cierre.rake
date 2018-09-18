namespace :cierre do
  desc "Sends the most voted products created yesterday"
  task historia_clinica: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
        
       ClinicHistory.all.each do |ch|
          
         if ch.first_contact_created_at != nil
           if ch.first_contact_created_at < Date.today() && !ch.first_contact_state
                        
                ch.first_contact_state = true
                ch.save

           end 

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

            if ch.desenlace_created_at < Date.today() && !ch.desenlace_first
                        
                ch.desenlace_first = true
                ch.save

           end   

          end 


       end


        Tracing.all.each do |tr|

          if tr.tracing_created_at != nil

            if tr.tracing_created_at < Date.today() && !tr.tracing_state
                        
                tr.tracing_state = true
                tr.save

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