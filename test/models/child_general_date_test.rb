# == Schema Information
#
# Table name: child_general_dates
#
#  id                    :integer          not null, primary key
#  father_name           :string
#  father_age            :integer
#  father_birthday       :date
#  father_job            :string
#  father_addictions     :string
#  father_relationship   :string
#  mother_name           :string
#  mother_age            :integer
#  mother_job            :string
#  parents_realationship :string
#  reasons_relationship  :string
#  parents_reaction      :string
#  patient_id            :integer
#  admin_user            :integer
#  user_id               :integer
#  account_id            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  mother_addictions     :string
#  mother_relationship   :string
#  mother_birthday       :date
#  clinic_history_id     :integer
#

require 'test_helper'

class ChildGeneralDateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
