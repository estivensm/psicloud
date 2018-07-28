# == Schema Information
#
# Table name: fields
#
#  id         :integer          not null, primary key
#  name       :string
#  type_field :string
#  state      :boolean
#  user_id    :integer
#  admin_user :integer
#  requierd   :boolean
#  form       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FieldTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
