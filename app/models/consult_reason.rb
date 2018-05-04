# == Schema Information
#
# Table name: consult_reasons
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  admin_user  :integer
#  name        :string
#  description :text
#  count       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ConsultReason < ApplicationRecord
	has_many :clinic_histories
end
