class Diagnostic < ApplicationRecord
	has_and_belongs_to_many :clinic_histories, dependent: :destroy
end
