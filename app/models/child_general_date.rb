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

class ChildGeneralDate < ApplicationRecord
        

	belongs_to :clinic_history
    has_many :create_fields
    has_many :child_brothers , inverse_of: :child_general_date, dependent: :destroy
    accepts_nested_attributes_for :child_brothers, :allow_destroy => true
    has_many :children , inverse_of: :child_general_date, dependent: :destroy
    accepts_nested_attributes_for :children, :allow_destroy => true
     

end

