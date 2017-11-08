class ChildBrother < ApplicationRecord
	belongs_to :child_general_date , inverse_of: :child_brothers
end
