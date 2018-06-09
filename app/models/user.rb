# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  provider               :string
#  acces_token            :string
#  refresh_token          :string
#  uid                    :string
#  token                  :string
#  names                  :string
#  last_names             :string
#  admin_user             :integer
#  account                :boolean
#  super_admin            :boolean
#  birth_date             :date
#  count                  :integer
#  avatar                 :string
#  rol_id                 :integer
#  document_type          :string
#  document               :string
#  medical_record         :string
#  state                  :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company                :string
#  legal                  :boolean
#  ip_address             :string
#  device                 :string
#  phone                  :integer
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
     belongs_to :rol, optional: true
     has_many :patients
     devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable,
       :omniauthable, :omniauth_providers => [:google_oauth2]
  mount_uploader :avatar, AvatarUploader  
  after_create :crear_admin

    def self.find_for_google_oauth2(auth)
    data = auth.info
    puts "holaaaaaaaaaaaaaaaaaaaaaaaaajajajajajaj"
    if User.where(email: auth.info.email).exists?
        user = User.where(email: auth.info.email).first do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email

        user.password = "alejo0906"
      end
      user.token = auth.credentials.token
      user.expires_at = auth.credentials.expires_at
      user.expires_ats = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      user.save
      return user
    else

       #user = User.new do |user|
        #user.provider = auth.provider
       # user.uid = auth.uid
       # user.email = auth.info.email
        #user.password = "alejo0906"
      #end
      #user.token = auth.credentials.token
      #user.refresh_token = auth.credentials.refresh_token
     # user.save
      return nil
    end
  end


  def refresh_token_if_expired
  if token_expired?
    
    url = URI("https://accounts.google.com/o/oauth2/token")
    net = Net::HTTP.post_form(url, { 'refresh_token' => self.refresh_token,
      'client_id'     => "537103906622-4n2q9h81kuucu4vppbg85lqahda3vohb.apps.googleusercontent.com",
      'client_secret' => "bkk9SygmN8ywbNB2tdFdL1VN",
      'grant_type'    => 'refresh_token'})


   
     
    refreshhash = JSON.parse(net.body)
    puts refreshhash
    puts "entre aquiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
    self.token     = refreshhash['access_token']
    self.expires_ats = DateTime.now + refreshhash["expires_in"].to_i.seconds

    self.save
    puts 'Saved'
  end
end

def token_expired?
  expiry = Time.at(self.expires_ats.to_i) 
   puts "entre aquiiiiiiiiiiiiiiiiiiiiiiiiiuuuuuuuuuuuuuuuuuuuuuuuuuuuuuiii"
  return true if expiry < Time.now # expired token, so we should quickly return
  token_expires_at = expiry
  save if changed?
  false # token not expired. :D
end


        def crear_admin

            if self.account
              self.admin_user = self.id
              self.count = 1
              Account.create(name: self.company, admin_user: self.id, phone: self.phone,email:self.email)
              Hpc.create(name: "Particular", admin_user: self.id,user_id: self.id)
              Agreement.create(name: "Particular", admin_user: self.id,user_id: self.id)
              Rol.create(admin_user: self.id, user_id: self.id, name: "Administrador", default: true,show_user: true,create_user: true,edit_user: true,delete_user: true,show_patient: true,create_patient: true,edit_patient: true,delete_patient: true,show_hc: true,create_hc: true,edit_hc: true,delete_hc: true,show_cita: true,create_cita: true,edit_cita: true,delete_cita: true,show_doc: true,create_doc: true,edit_doc: true,delete_doc: true,show_rol: true,create_rol: true,edit_rol: true,delete_rol: true,configuracion: true,show_all_user: true,show_all_patient: true,show_all_hc: true,show_all_cita: true,show_all_doc: true, show_all_rol: true)
              Rol.create(admin_user: self.id, user_id: self.id, name: "Psicologo", default: true,show_user: false,create_user: false,edit_user: false,delete_user: false,show_patient: true,create_patient: true,edit_patient: true,delete_patient: true,show_hc: true,create_hc: true,edit_hc: true,delete_hc: true,show_cita: true,create_cita: true,edit_cita: true,delete_cita: true,show_doc: true,create_doc: true,edit_doc: true,delete_doc: true,show_rol: false,create_rol: false,edit_rol: false,delete_rol: false,configuracion: false,show_all_user: false,show_all_patient: false,show_all_hc: false,show_all_cita: false,show_all_doc: false, show_all_rol: false)
              self.rol_id =  Rol.where(admin_user: self.id).where(name: "Administrador").last.id
                
            end  
              
        end

end



    



