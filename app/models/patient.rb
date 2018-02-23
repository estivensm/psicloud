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
#  count                :integer
#  agreement_id         :integer
#  avatar               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  movil                :string
#  city                 :string
#  data                 :text
#  hpc_id               :integer
#  birthdate_month      :integer
#  birthdate_day        :integer
#  school_grade         :string
#

class Patient < ApplicationRecord
     has_many :clinic_histories  , dependent: :destroy
     has_many :appointments , dependent: :destroy
     belongs_to :hpc
     belongs_to :agreement
     mount_uploader :avatar, AvatarPatientUploader  
     

  def self.search(search)
    where("(first_name || ' ' || second_name || ' ' || first_last_name  || ' ' || second_last_name) like '%#{search}%'  or 
      first_name like '%#{search.capitalize}%' or 
      second_name like '%#{search.capitalize}%' or 
      second_last_name like '%#{search.capitalize}%' or 
      email like '%#{search}%' or 
      document like '%#{search}%'").order(:id)
  end

      def self.searchp(search)
           
           if search != nil
           where("lower(first_name) like '%#{search.downcase}%' or 
      lower(second_name) like '%#{search.downcase}%' or 
      lower(second_last_name) like '%#{search.downcase}%' or 
      lower(email) like '%#{search.downcase}%' or 
      lower(document) like '%#{search.downcase}%'")
                
                else

                  all
           end

        end

  

    def self.to_csv()
          attributes = %w{PrimerNombre SegundoNombre PrimerApellido SegundoApellido TipoDocumento document}
            CSV.generate(headers: true) do |csv|
              csv <<  attributes
              all.each do |patient|
               csv << attributes.map{ |attr| patient.send(attr) }
              end
            end
        end  

        def PrimerNombre
          "#{first_name}"
        end
        
        def SegundoNombre
          "#{second_name}"
        end

        def PrimerApellido
          "#{first_last_name}"
        end

        def SegundoApellido
          "#{second_last_name}"
        end

        def TipoDocumento
          "#{document_type}"
        end

        def Documento

          "#{document}"
          
        end

     

end
