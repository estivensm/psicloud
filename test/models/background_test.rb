# == Schema Information
#
# Table name: backgrounds
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  admin_user        :integer
#  patient_id        :integer
#  clinic_history_id :integer
#  description       :text
#  attachment        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  type_background   :string
#  clase             :string
#

require 'test_helper'

class BackgroundTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
