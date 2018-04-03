# == Schema Information
#
# Table name: accounts
#
#  id                 :integer          not null, primary key
#  name               :string
#  address            :string
#  phone              :string
#  email              :string
#  logo               :string
#  admin_user         :integer
#  users_quantity     :integer
#  file_size          :integer
#  account_type       :string
#  state              :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  nit                :string
#  file_size_add      :integer
#  users_quantity_add :integer
#  file_size_now      :integer
#  users_quantity_now :integer
#  account_type_id    :integer
#

class Account < ApplicationRecord
	belongs_to :account_type
	mount_uploader :logo, LogoUploader 
end
