# == Schema Information
#
# Table name: created_formats
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  admin_user  :integer
#  format      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CreatedFormat < ApplicationRecord
end
