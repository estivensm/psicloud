# == Schema Information
#
# Table name: general_files
#
#  id                        :integer          not null, primary key
#  user_id                   :integer
#  admin_user                :integer
#  file                      :string
#  name                      :string
#  tool_test_id              :integer
#  tracing_id                :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  document_id               :integer
#  personal_background_id    :integer
#  background_id             :integer
#  diagnostic_help_id        :integer
#  legal_document_id         :integer
#  tracing_couple_family_id  :integer
#  document_couple_family_id :integer
#  tracing_family_id         :integer
#  document_family_id        :integer
#

class GeneralFile < ApplicationRecord
	belongs_to :tool_test , inverse_of: :general_files , optional: true

	belongs_to :diagnostic_help , inverse_of: :general_files , optional: true
	belongs_to :legal_document , inverse_of: :general_files , optional: true
	belongs_to :tracing_couple_family, inverse_of: :general_files , optional: true
	belongs_to :tracing_family, inverse_of: :general_files, optional: true
	belongs_to :document_family, inverse_of: :general_files, optional: true
	
	belongs_to :document_couple_family , inverse_of: :general_files , optional: true


	belongs_to :tracing , inverse_of: :general_files, optional: true
	belongs_to :document , inverse_of: :general_files, optional: true
    mount_uploader :file, FileToolUploader  



        
end
