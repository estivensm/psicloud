# == Schema Information
#
# Table name: children
#
#  id                    :integer          not null, primary key
#  name                  :string
#  genero                :string
#  age                   :integer
#  relationship          :string
#  observations          :text
#  child_general_date_id :integer
#  state                 :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Child < ApplicationRecord
	belongs_to :child_general_date , inverse_of: :children
end

