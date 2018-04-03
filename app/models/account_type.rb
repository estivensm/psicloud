# == Schema Information
#
# Table name: account_types
#
#  id         :integer          not null, primary key
#  name       :string
#  users      :integer
#  file_size  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AccountType < ApplicationRecord
	has_many :accounts
end
