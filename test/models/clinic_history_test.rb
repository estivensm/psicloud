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
#  codigo                  :string
#  created_date            :datetime
#  first_contact_state     :boolean
#  outcome_state           :boolean
#  consult_reason_id       :integer
#  first_child_state       :boolean
#  second_child_state      :boolean
#  third_child_state       :boolean
#  four_child_state        :boolean
#  desenlace_first         :boolean
#  desenlace_created_at    :datetime
#  first_child_first       :boolean
#  child_first_created_at  :datetime
#  first_child_second      :boolean
#  second_child_created_at :datetime
#  first_child_third       :boolean
#  third_child_created_at  :datetime
#  first_child_four        :boolean
#  four_child_created_at   :datetime
#

require 'test_helper'

class ClinicHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
