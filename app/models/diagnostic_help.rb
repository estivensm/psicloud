# == Schema Information
#
# Table name: diagnostic_helps
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  type_document     :string
#  user_id           :integer
#  admin_user        :integer
#  clinic_history_id :integer
#  patient_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class DiagnosticHelp < ApplicationRecord
	belongs_to :clinic_history
	mount_uploader :attachment, AttachmentToolUploader 
	has_many :general_files , inverse_of: :tool_test, dependent: :destroy
	accepts_nested_attributes_for :general_files, :allow_destroy => true
end
