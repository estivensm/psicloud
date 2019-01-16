 # == Schema Information
#
# Table name: clinic_history_couple_outcomes
#
#  id                       :integer          not null, primary key
#  clinic_history_family_id :integer
#  clinic_history_couple_id :integer
#  diagnostic_description   :text
#  therapeutic_goal         :text
#  type_of_treatment        :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class ClinicHistoryCoupleOutcome < ApplicationRecord
	belongs_to :clinic_history_couple
	has_and_belongs_to_many :diagnostic, dependent: :destroy
	has_and_belongs_to_many :first_diagnostico, dependent: :destroy
end
