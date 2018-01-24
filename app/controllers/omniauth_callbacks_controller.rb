class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
  	puts request.env["omniauth.auth"]
  	puts "ENVIROMENNNNNNNNNNNNNNNNNNNNNNN"
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"])

    if @user
      flash[:notice] = I18n.t "Tu autenticacion con Google calendar fue exitosa", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      redirect_to new_user_session_path, notice: 'Access Denied'
    end
  end
end