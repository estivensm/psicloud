# == Schema Information
#
# Table name: personal_backgrounds
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  admin_user        :integer
#  patient_id        :integer
#  clinic_history_id :integer
#  attachement       :string
#  description       :string
#  type_background   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class PersonalBackground < ApplicationRecord
	belongs_to :clinic_history, inverse_of: :personal_backgrounds
    mount_uploader :attachement, AttaachmentsPersonalBackgroundsUploader
end
