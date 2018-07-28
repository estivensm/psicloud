# == Schema Information
#
# Table name: crete_fields
#
#  id                :integer          not null, primary key
#  admin_user        :integer
#  user_id           :integer
#  content           :text
#  clinic_history_id :integer
#  field_id          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  check_box_field   :boolean
#  text_field        :string
#  select_field      :string
#

require 'test_helper'

class CreteFieldTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
