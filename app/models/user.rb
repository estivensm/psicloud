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
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
     belongs_to :rol
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
      user.refresh_token = auth.credentials.refresh_token
      user.save
      return user
    else

       user = User.new do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = "alejo0906"
      end
      user.token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.save
      return user
    end
  end


        def crear_admin

            if self.account
              self.admin_user = self.id

              self.count = 1
               Account.create(name: self.company, admin_user: self.id)
               Hpc.create(name: "Particular", admin_user: self.id,user_id: self.id)
               Agreement.create(name: "Particular", admin_user: self.id,user_id: self.id)
            
                
            end  
              
        end

end



    



