# == Schema Information
#
# Table name: clinichistory_configs
#
#  id           :integer          not null, primary key
#  header_image :string
#  footer_image :string
#  header_text  :text
#  footer_text  :text
#  state        :string
#  admin_user   :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ClinichistoryConfigTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
