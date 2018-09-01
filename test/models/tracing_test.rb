# == Schema Information
#
# Table name: tracings
#
#  id                :integer          not null, primary key
#  admin_user        :integer
#  user_id           :integer
#  patient_id        :integer
#  clinic_history_id :integer
#  description       :text
#  attachment        :string
#  tracing_type      :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  tracing_date      :date
#  observation       :text
#  evolution         :text
#

require 'test_helper'

class TracingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
