# == Schema Information
#
# Table name: hpcs
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  user_id     :integer
#  admin_user  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Hpc < ApplicationRecord
	has_many :patients
end
