class GeneralFile < ApplicationRecord
	belongs_to :tool_test , inverse_of: :general_files


end
