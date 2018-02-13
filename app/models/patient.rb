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

      def self.searchp(search,search1,search2)
           
           search != "" && search != nil ? (scope :named, -> { where("first_name like '%#{search.downcase}%' or first_name like '%#{search.upcase}%'  or first_name like '%#{search.capitalize}%' or second_name like '%#{search.downcase}%' or second_name like '%#{search.upcase}%'  or second_name like '%#{search.capitalize}%' ") }) : (scope :named, -> { where.not(id: nil) })  
           search1 != "" && search1 != nil ? (scope :apellidod, -> { where("first_last_name like '%#{search.downcase}%' or first_last_name like '%#{search.upcase}%'  or first_last_name like '%#{search.capitalize}%' or second_last_name like '%#{search.downcase}%' or second_last_name like '%#{search.upcase}%'  or second_last_name like '%#{search.capitalize}%' ") }) : (scope :apellidod, -> { where.not(id: nil) })  
           search2 != "" && search2 != nil ? (scope :document, -> { where("document like '%#{search.downcase}%' or document like '%#{search.upcase}%'  or document like '%#{search.capitalize}%' ") }) : (scope :document, -> { where.not(id: nil) })  

           named.apellidod.document
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
