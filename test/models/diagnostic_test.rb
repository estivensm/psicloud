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

require 'test_helper'

class DiagnosticTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
