class Account < ApplicationRecord
	mount_uploader :logo, LogoUploader 
end
