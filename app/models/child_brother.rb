# == Schema Information
#
# Table name: child_brothers
#
#  id                    :integer          not null, primary key
#  name                  :string
#  sexo                  :string
#  edad                  :string
#  birthdate             :string
#  relationship          :string
#  observations          :string
#  child_general_date_id :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class ChildBrother < ApplicationRecord
	belongs_to :child_general_date , inverse_of: :child_brothers
end
