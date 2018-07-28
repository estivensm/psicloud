# == Schema Information
#
# Table name: general_files
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  admin_user   :integer
#  file         :string
#  name         :string
#  tool_test_id :integer
#  tracing_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class GeneralFile < ApplicationRecord
	belongs_to :tool_test , inverse_of: :general_files , optional: true
	belongs_to :tracing , inverse_of: :general_files, optional: true
	belongs_to :document , inverse_of: :general_files, optional: true
    mount_uploader :file, FileToolUploader  

        
end
