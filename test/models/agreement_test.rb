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

require 'test_helper'

class AgreementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
