# == Schema Information
#
# Table name: outcome_families
#
#  id                       :integer          not null, primary key
#  clinic_history_family_id :integer
#  diagnostic_description   :text
#  therapeutic_goal         :text
#  type_of_treatment        :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class OutcomeFamily < ApplicationRecord
	belongs_to :clinic_history_families, optional: true
	has_and_belongs_to_many :diagnostic, dependent: :destroy
	has_and_belongs_to_many :first_diagnostico, dependent: :destroy
end
