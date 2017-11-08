# == Schema Information
#
# Table name: agreements
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  percent     :float
#  user_id     :integer
#  admin_user  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Agreement < ApplicationRecord
	has_many :patients
	
end
