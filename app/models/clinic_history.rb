class ClinicHistory < ApplicationRecord
	belongs_to :patient
	has_many :backgrounds
	has_many :tool_tests
	has_and_belongs_to_many :diagnostics, dependent: :destroy
end
