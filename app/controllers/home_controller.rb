class HomeController < ApplicationController
	 before_action :authenticate_user!
  def index

  	 if params[:search].present?
        @pacientes = Patient.where(user_id: current_user.id).search(params[:search]).page(params[:page]).per_page(10)
    end


    if request.xhr?
      render partial: 'personas', status: 200
    end

  end
end
