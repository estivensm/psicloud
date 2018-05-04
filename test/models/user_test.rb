# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  provider               :string
#  acces_token            :string
#  refresh_token          :string
#  uid                    :string
#  token                  :string
#  names                  :string
#  last_names             :string
#  admin_user             :integer
#  account                :boolean
#  super_admin            :boolean
#  birth_date             :date
#  count                  :integer
#  avatar                 :string
#  rol_id                 :integer
#  document_type          :string
#  document               :string
#  medical_record         :string
#  state                  :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company                :string
#  legal                  :boolean
#  ip_address             :string
#  device                 :string
#  phone                  :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
