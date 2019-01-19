# == Schema Information
#
# Table name: tracing_families
#
#  id                       :integer          not null, primary key
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

class TracingFamily < ApplicationRecord
	belongs_to :clinic_history_families, optional: true

	has_many :general_files , inverse_of: :tracing, dependent: :destroy
	accepts_nested_attributes_for :general_files, :allow_destroy => true
	
end
