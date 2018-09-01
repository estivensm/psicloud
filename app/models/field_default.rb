# == Schema Information
#
# Table name: field_defaults
#
#  id                        :integer          not null, primary key
#  user_id                   :integer
#  admin_user                :integer
#  account_id                :integer
#  observation_tracing_state :boolean
#  evolution_tracing_state   :boolean
#  description_tracing_state :boolean
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class FieldDefault < ApplicationRecord
end
