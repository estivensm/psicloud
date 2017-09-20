class ToolTest < ApplicationRecord
	belongs_to :clinic_history
	mount_uploader :attachment, AttachmentToolUploader 
end
