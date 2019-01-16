# == Schema Information
#
# Table name: family_groups
#
#  id                       :integer          not null, primary key
#  name                     :string
#  last_name                :string
#  document_number          :integer
#  age                      :integer
#  sex                      :string
#  civil_status             :string
#  occupation               :string
#  relationship             :string
#  clinic_history_family_id :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class FamilyGroup < ApplicationRecord
	  belongs_to :clinic_history_family , inverse_of: :family_group
end
