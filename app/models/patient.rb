class Patient < ApplicationRecord

	 mount_uploader :avatar, AvatarPatientUploader  

	def self.search(search)
    where("(first_name || ' ' || second_name || ' ' || first_last_name  || ' ' || second_last_name) like '%#{search}%'  or 
       second_name like '%#{search}%' or 
      second_last_name like '%#{search}%' or 
      email like '%#{search}%' or 
      document like '%#{search}%'").order(:id)
  end
end
