# == Schema Information
#
# Table name: clinic_histories
#
#  id                      :integer          not null, primary key
#  clinic_history_id       :integer
#  count                   :integer
#  consultation_reason     :text
#  actual_state            :text
#  diagnostic_hypothesis   :text
#  therapeutic_goal        :text
#  quantity_appointment    :integer
#  frequency_appointment   :string
#  user_id                 :integer
#  admin_user              :integer
#  patient_id              :integer
#  type_of_treatment       :text
#  description_appointment :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  family_dinamic          :text
#  child_history           :boolean
#

require 'test_helper'

class ClinicHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
