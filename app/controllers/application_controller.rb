class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    [:account_update,:sign_up].each do |metodo|
    devise_parameter_sanitizer.permit(metodo, keys: [:email,:company,:names,:last_names,:admin_user,:rol_id,:avatar, :birth_date,:document,:document_type, :medical_record,:state,:account,:count,:legal,:ip_address,:device])
    end
  end



layout :layout_for_selection
protected
  def layout_for_selection
    if controller_name == 'sessions'  || controller_name == 'passwords' 
      'application'
    elsif controller_name == 'registrations'

        if action_name == "new" || action_name == "create"
            'application'
            else
            	'admin'
        end
    	else
      'admin'
    end
  end



  def split_base64(uri_str)
    puts "holeeeeeeeeeeeeeeeeeeeeeeeeee"
  if uri_str.match(%r{^data:(.*?);(.*?),(.*)$})
    uri = Hash.new
    uri[:type] = $1 # "image/gif"
    uri[:encoder] = $2 # "base64"
    uri[:data] = $3 # data string
    uri[:extension] = $1.split('/')[1] # "gif"
    return uri
  else
    return nil
  end
end
 
# Convert data uri to uploaded file. Expects object hash, eg: params[:post]
def convert_data_uri_to_upload(data_uri)
  puts "holaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  puts data_uri
  if !data_uri.blank?
    image_data = split_base64(data_uri)
    puts "uriiiiiiiiiiiiiiiiiiiiiii"
    puts data_uri
    image_data_string = image_data[:data]
    image_data_binary = Base64.decode64(image_data_string)
 
    temp_img_file = Tempfile.new("data_uri-upload")
    temp_img_file.binmode
    temp_img_file << image_data_binary
    temp_img_file.rewind
 
    img_params = {:filename => "data-uri-img.#{image_data[:extension]}", :type => image_data[:type], :tempfile => temp_img_file}
    uploaded_file = ActionDispatch::Http::UploadedFile.new(img_params)
 
    return uploaded_file
  end
 
  return nil
end
end
