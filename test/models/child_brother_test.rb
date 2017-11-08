# == Schema Information
#
# Table name: child_brothers
#
#  id                    :integer          not null, primary key
#  name                  :string
#  sexo                  :string
#  edad                  :string
#  birthdate             :string
#  relationship          :string
#  observations          :string
#  child_general_date_id :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class ChildBrotherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
