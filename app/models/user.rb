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
#  sign_in_count          :integer          default("0"), not null
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
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader  
  after_create :crear_admin



        def crear_admin

            if self.account
              self.admin_user = self.id
              self.count = 1
               Account.create(name: self.company, admin_user: self.id)
            
                
            end  
              
        end

end
