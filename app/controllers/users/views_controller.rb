class Users::ViewsController < Devise::RegistrationsController

    def index
        
        @users = User.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 3)
    end

    def new_user
        u = User.find(current_user.id)
        @rols = Rol.where(admin_user: current_user.admin_user).or(Rol.where(default:true))
    end
    
    def edit_user
      
        @user = User.find(params[:id])
        @rols = Rol.where(admin_user: current_user.admin_user).or(Rol.where(default:true))
        

    end

    def show_user
        
        @user = User.find(params[:id])


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
  
end


def crear_firma_psicologo

    @user = User.find(params[:user_id])
   
   # if !params[:firma_paciente].blank?
      if @user.update(firma_psicologo: params[:firma_psicologo]) 
        
        @state = true

      
      end 
    #end 
     end

end	