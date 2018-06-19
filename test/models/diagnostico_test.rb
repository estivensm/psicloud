# == Schema Information
#
# Table name: diagnosticos
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  admin_user  :integer
#  user_id     :integer
#  count       :integer
#  codigo      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class DiagnosticoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
