class Background < ApplicationRecord
	belongs_to :clinic_history
    mount_uploader :attachment, AttachmentBackgroundUploader  
end
