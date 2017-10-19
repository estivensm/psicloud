# == Schema Information
#
# Table name: patients
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  second_name          :string
#  first_last_name      :string
#  second_last_name     :string
#  birth_date           :date
#  age                  :integer
#  document_type        :string
#  document             :string
#  occupation           :string
#  profession           :string
#  phone                :string
#  address              :string
#  email                :string
#  contact_name         :string
#  contact_phone        :string
#  contact_relationship :string
#  gender               :string
#  civil_status         :string
#  blood_type           :string
#  ethnic_group         :string
#  user_id              :integer
#  admin_user           :integer
#  eps_id               :integer
#  count                :integer
#  agreement_id         :integer
#  avatar               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  movil                :string
#  city                 :string
#  data                 :text
#

class Patient < ApplicationRecord
     has_many :clinic_histories  
     has_many :appointments 
	 mount_uploader :avatar, AvatarPatientUploader  
	 

	def self.search(search)
    where("(first_name || ' ' || second_name || ' ' || first_last_name  || ' ' || second_last_name) like '%#{search}%'  or 
       second_name like '%#{search}%' or 
      second_last_name like '%#{search}%' or 
      email like '%#{search}%' or 
      document like '%#{search}%'").order(:id)
  end
end
