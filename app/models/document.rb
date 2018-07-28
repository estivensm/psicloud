# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  name        :string
#  file        :string
#  description :text
#  state       :boolean
#  user_id     :integer
#  admin_user  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Document < ApplicationRecord
    mount_uploader :file, FormatUploader  
    has_many :general_files , inverse_of: :document, dependent: :destroy
	accepts_nested_attributes_for :general_files, :allow_destroy => true	   
end
