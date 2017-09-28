class Tracing < ApplicationRecord
	belongs_to :clinic_history
    mount_uploader :attachment, AttachmentTracingUploader 
end
