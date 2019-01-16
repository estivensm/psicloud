# == Schema Information
#
# Table name: tracing_couple_families
#
#  id                       :integer          not null, primary key
#  clinic_history_couple_id :integer
#  clinic_history_family_id :integer
#  admin_user               :integer
#  user_id                  :integer
#  description              :text
#  attachment               :string
#  tracing_type             :string
#  tracing_date             :date
#  observation              :text
#  evolution                :text
#  tracing_state            :boolean
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class TracingCoupleFamily < ApplicationRecord
	belongs_to :user
	
	belongs_to :clinic_history_couple , optional: true
	belongs_to :clinic_history_family_id , optional: true

	has_many :general_files , inverse_of: :tracing, dependent: :destroy
	accepts_nested_attributes_for :general_files, :allow_destroy => true
	
end

