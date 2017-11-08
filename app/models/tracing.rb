# == Schema Information
#
# Table name: tracings
#
#  id                :integer          not null, primary key
#  admin_user        :integer
#  user_id           :integer
#  patient_id        :integer
#  clinic_history_id :integer
#  description       :text
#  attachment        :string
#  tracing_type      :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Tracing < ApplicationRecord
	belongs_to :clinic_history
    mount_uploader :attachment, AttachmentTracingUploader 
end
