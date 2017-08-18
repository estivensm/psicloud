class Users::ViewsController < Devise::RegistrationsController

    def index
        
        @users = User.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 3)
    end

    def new_user
        u = User.find(current_user.id)
    end

    def create_user
        maximum = User.where(admin_user: current_user.admin_user).maximum(:count) + 1 
        @user = User.create(email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation],admin_user:params[:admin_user], company:params[:company],account: false, count: maximum)
        if @user.save
           
            redirect_to users_index_path
  end
    end

end	