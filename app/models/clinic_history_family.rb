# == Schema Information
#
# Table name: clinic_history_families
#
#  id                  :integer          not null, primary key
#  reason_consultation :text
#  antecedent_problem  :text
#  family_problem      :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class ClinicHistoryFamily < ApplicationRecord
	has_and_belongs_to_many :patient

	has_many :family_group, inverse_of: :clinic_history_family, dependent: :destroy
 	accepts_nested_attributes_for :family_group, :allow_destroy => true

end
