# == Schema Information
#
# Table name: consents
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  admin_user :integer
#  account_id :integer
#  body       :text
#  title      :string
#  first_age  :integer
#  second_age :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  header     :text
#  footer     :text
#  state      :boolean
#

class Consent < ApplicationRecord
	 belongs_to :user
end
