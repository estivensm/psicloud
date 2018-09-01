# == Schema Information
#
# Table name: fieldselects
#
#  id         :integer          not null, primary key
#  field_id   :integer
#  admin_user :integer
#  user_id    :integer
#  option     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fieldselect < ApplicationRecord
	belongs_to :field , inverse_of: :fieldselects
end
