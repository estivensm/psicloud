# == Schema Information
#
# Table name: accounts
#
#  id             :integer          not null, primary key
#  name           :string
#  address        :string
#  phone          :string
#  email          :string
#  logo           :string
#  admin_user     :integer
#  users_quantity :integer
#  file_size      :integer
#  account_type   :string
#  state          :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Account < ApplicationRecord
	mount_uploader :logo, LogoUploader 
end
