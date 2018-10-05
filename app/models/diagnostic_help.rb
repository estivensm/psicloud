class DiagnosticHelp < ApplicationRecord
	belongs_to :clinic_history
	mount_uploader :attachment, AttachmentToolUploader 
	has_many :general_files , inverse_of: :tool_test, dependent: :destroy
	accepts_nested_attributes_for :general_files, :allow_destroy => true
end
