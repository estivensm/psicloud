# == Schema Information
#
# Table name: tool_tests
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  admin_user        :integer
#  patient_id        :integer
#  clinic_history_id :integer
#  type_tool         :string
#  description       :text
#  attachment        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ToolTest < ApplicationRecord
	belongs_to :clinic_history
	
	mount_uploader :attachment, AttachmentToolUploader 
	has_many :general_files , inverse_of: :tool_test, dependent: :destroy
	accepts_nested_attributes_for :general_files, :allow_destroy => true
	
end
