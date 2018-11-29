class Users::ViewsController < Devise::RegistrationsController

    def index
        
        @users = User.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 3)
    end

    def new_user
        u = User.find(current_user.id)
        @rols = Rol.where(admin_user: current_user.admin_user).or(Rol.where(default:true).where(admin_user: current_user.admin_user))
    end
    
    def edit_user
      
        @user = User.find(params[:id])
        @rols = Rol.where(admin_user: current_user.admin_user).or(Rol.where(default:true).where(admin_user: current_user.admin_user))
        

    end

    def show_user
        
        @user = User.find(params[:id])
        @patient = Patient.where(admin_user: current_user.admin_user)
    end

    
    def create_user
        maximum = User.where(admin_user: current_user.admin_user).maximum(:count) + 1 
        @user = User.create(email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation],admin_user:params[:admin_user], company:params[:company],account: false, count: maximum,rol_id:params[:rol_id])
        if @user.save
           
            redirect_to users_index_path
  end
    end

      def update_user
       @user = User.find(params[:id])
       if   @user.update(email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation],rol_id:params[:rol_id])

           
            redirect_to users_index_path
  end 
    end

    def delete_user
  @user = User.find(params[:id])
  if @user.destroy
           
            redirect_to users_index_path
  end
  
     
end


def firma_psicologo

      @user = User.find(params[:id])
      if @user.signature_format == nil
          puts "signatureeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
          @user.signature_format = ""
          @user.save
      end  

      if @user.tipo_firma == "Adjunta"
         puts "adjuntaaa"
         @adjunta = true
         @digital = nil
         @sinfirma  = nil
      elsif @user.tipo_firma == "Firma Digital"
         puts "Firma Digital"
         @adjunta = nil
         @digital = true
         @sinfirma  = nil
      else  
         puts "sin firma"
         @adjunta = nil
         @digital = nil
         @sinfirma  = true
      end

puts @user.tipo_firma


  
end


def crear_firma_psicologo

    @user = User.find(params[:user_id])
   
   # if !params[:firma_paciente].blank?
      if @user.update(firma_psicologo: params[:firma_psicologo]) 
        
        @state = true

      
      end 
    #end 
     end

    def crear_firma_adjunta

    @user = User.find(params[:user_id])
   
   # if !params[:firma_paciente].blank?
      if @user.update(firma_adjunta: params[:firma_adjunta]) 
        
        redirect_to firma_psicologo_path(@user.id)

      
      end 
    #end 
     end

     def crear_formato

    @user = User.find(params[:user_id])
   
   # if !params[:firma_paciente].blank?
      if @user.update(signature_format: params[:signature_format]) 
        
        redirect_to firma_psicologo_path(@user.id)

      
      end 
    #end 
     end


    def cambiar_tipo_firma

          @user = User.find(params[:id])
   
   # if !params[:firma_paciente].blank?
      if @user.update(tipo_firma: params[:tipo]) 
        
        redirect_to firma_psicologo_path(@user.id)

      
      end 
    
    end

end	