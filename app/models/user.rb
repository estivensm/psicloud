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
