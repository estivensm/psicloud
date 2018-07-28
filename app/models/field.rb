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

class Field < ApplicationRecord
    belongs_to :user
    has_many :crete_fields, dependent: :destroy
   	has_many :fieldselects , inverse_of: :field, dependent: :destroy
	accepts_nested_attributes_for :fieldselects, :allow_destroy => true

end
