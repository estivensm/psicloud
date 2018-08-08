# == Schema Information
#
# Table name: clinic_histories
#
#  id                      :integer          not null, primary key
#  clinic_history_id       :integer
#  count                   :integer
#  consultation_reason     :text
#  actual_state            :text
#  diagnostic_hypothesis   :text
#  therapeutic_goal        :text
#  quantity_appointment    :integer
#  frequency_appointment   :string
#  user_id                 :integer
#  admin_user              :integer
#  patient_id              :integer
#  type_of_treatment       :text
#  description_appointment :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  family_dinamic          :text
#  child_history           :boolean
#  codigo                  :string
#  created_date            :datetime
#  first_contact_state     :boolean
#  outcome_state           :boolean
#  consult_reason_id       :integer
#  first_child_state       :boolean
#  second_child_state      :boolean
#  third_child_state       :boolean
#  four_child_state        :boolean
#  desenlace_first         :boolean
#  desenlace_created_at    :datetime
#  first_child_first       :boolean
#  child_first_created_at  :datetime
#  first_child_second      :boolean
#  second_child_created_at :datetime
#  first_child_third       :boolean
#  third_child_created_at  :datetime
#  first_child_four        :boolean
#  four_child_created_at   :datetime
#

class ClinicHistory < ApplicationRecord
	belongs_to :patient
    belongs_to :consult_reason, optional: true
	has_one  :child_general_date, dependent: :destroy
    has_one  :personal_history, dependent: :destroy
    has_one  :two_child_history, dependent: :destroy
    has_one  :three_child_history , dependent: :destroy
	has_many :backgrounds , inverse_of: :clinic_history, dependent: :destroy
    has_many :personal_backgrounds , inverse_of: :clinic_history, dependent: :destroy
	has_many :tool_tests , dependent: :destroy
	has_many :tracings , dependent: :destroy
    belongs_to :diagnostico, optional: true 
	has_and_belongs_to_many :diagnostics, dependent: :destroy
    has_and_belongs_to_many :diagnosticos, dependent: :destroy
   
    after_create :create_familiar_history
  
    accepts_nested_attributes_for :backgrounds, :allow_destroy => true
    accepts_nested_attributes_for :personal_backgrounds, :allow_destroy => true

    def create_familiar_history
        patient = Patient.find(self.patient_id)
        self.created_date = Time.now    
    	if patient.age < 14 
            
            ChildGeneralDate.create(user_id: self.user_id, admin_user: self.admin_user, patient_id: self.patient_id, clinic_history_id:self.id)
    	    PersonalHistory.create(user_id: self.user_id, admin_user: self.admin_user, patient_id: self.patient_id, clinic_history_id:self.id)
            TwoChildHistory.create(user_id: self.user_id, admin_user: self.admin_user, patient_id: self.patient_id, clinic_history_id:self.id)
            ThreeChildHistory.create(user_id: self.user_id, admin_user: self.admin_user, patient_id: self.patient_id, clinic_history_id:self.id)
        end
    	
    end
end
