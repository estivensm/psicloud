# == Schema Information
#
# Table name: diagnostics
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  admin_user  :integer
#  user_id     :integer
#  count       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Diagnostic < ApplicationRecord
	has_and_belongs_to_many :clinic_histories, dependent: :destroy
end
