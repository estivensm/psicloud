# == Schema Information
#
# Table name: document_couple_families
#
#  id                       :integer          not null, primary key
#  tool_type                :string
#  descripcion              :text
#  document_type            :string
#  name                     :string
#  clinic_history_couple_id :integer
#  clinic_history_family_id :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class DocumentCoupleFamily < ApplicationRecord
	has_many :clinic_history_couple
	has_many :general_files , inverse_of: :tracing, dependent: :destroy
	accepts_nested_attributes_for :general_files, :allow_destroy => true
	
end
