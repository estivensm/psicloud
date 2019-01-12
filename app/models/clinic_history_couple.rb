# == Schema Information
#
# Table name: clinic_history_couples
#
#  id                          :integer          not null, primary key
#  couple_patient_id           :integer
#  previous_unions_patient     :integer
#  previous_unions_couple      :integer
#  previous_children_patient   :integer
#  previous_children_couple    :integer
#  problematic_conduct_patient :text
#  problematic_conduct_couple  :text
#  consultation_reason         :text
#  general_observations        :text
#  actual_situations           :text
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  patient_id                  :integer
#

class ClinicHistoryCouple < ApplicationRecord
	belongs_to :patient
	belongs_to :tracing, optional: true

	belongs_to :document_couple_family
	
	has_many :clinic_history_couple_outcome

	belongs_to :tracing_couple_family
	
	after_create :create_outcome


	def create_outcome
		ClinicHistoryCoupleOutcome.create(clinic_history_couple_id: self.id )
	end

end
