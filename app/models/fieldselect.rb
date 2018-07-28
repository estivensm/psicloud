class Fieldselect < ApplicationRecord
	belongs_to :field , inverse_of: :fieldselects
end
