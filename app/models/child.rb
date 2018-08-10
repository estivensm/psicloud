class Child < ApplicationRecord
	belongs_to :child_general_date , inverse_of: :children
end

