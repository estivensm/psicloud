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
#  tracing_date      :date
#

class Tracing < ApplicationRecord
	belongs_to :clinic_history
    mount_uploader :attachment, AttachmentTracingUploader 
    has_many :general_files , inverse_of: :tracing, dependent: :destroy
	accepts_nested_attributes_for :general_files, :allow_destroy => true
end
