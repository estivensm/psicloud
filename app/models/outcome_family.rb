# == Schema Information
#
# Table name: outcome_families
#
#  id                       :integer          not null, primary key
#  clinic_history_family_id :integer
#  clinic_history_couple_id :integer
#  diagnostic_description   :text
#  therapeutic_goal         :integer
#  type_of_treatment        :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class OutcomeFamily < ApplicationRecord
	belongs_to :clinic_history_families, optional: true
	has_and_belongs_to_many :diagnostic, dependent: :destroy
	has_and_belongs_to_many :first_diagnostico, dependent: :destroy
end
