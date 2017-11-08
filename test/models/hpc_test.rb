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

require 'test_helper'

class HpcTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
