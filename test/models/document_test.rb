# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  name        :string
#  file        :string
#  description :text
#  state       :boolean
#  user_id     :integer
#  admin_user  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
