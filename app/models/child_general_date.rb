# == Schema Information
#
# Table name: child_general_dates
#
#  id                                   :integer          not null, primary key
#  father_name                          :string
#  father_age                           :integer
#  father_birthday                      :date
#  father_job                           :string
#  father_addictions                    :string
#  father_relationship                  :string
#  mother_name                          :string
#  mother_age                           :integer
#  mother_birthday                      :string
#  mother_job                           :string
#  mother_addictionsmother_relationship :string
#  parents_realationship                :string
#  reasons_relationship                 :string
#  parents_reaction                     :string
#  patient_id                           :integer
#  admin_user                           :integer
#  user_id                              :integer
#  account_id                           :integer
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#

class ChildGeneralDate < ApplicationRecord
	belongs_to :clinic_history
    has_many :child_brothers , inverse_of: :child_general_date, dependent: :destroy
     accepts_nested_attributes_for :child_brothers, :allow_destroy => true
end
