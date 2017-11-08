class PersonalBackground < ApplicationRecord
	belongs_to :clinic_history, inverse_of: :personal_backgrounds
    mount_uploader :attachement, AttaachmentsPersonalBackgroundsUploader
end