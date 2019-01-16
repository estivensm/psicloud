class FirstDiagnosticosController < ApplicationController
 before_action :authenticate_user!

    
 def import
  FirstDiagnostico.import(params[:file])
  redirect_to root_path, notice: "Los Registros fueron importados Exitosamente"
 end

end