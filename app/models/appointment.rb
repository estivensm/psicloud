# == Schema Information
#
# Table name: appointments
#
#  id              :integer          not null, primary key
#  start_datetime  :datetime
#  end_datetime    :datetime
#  observations    :text
#  place           :string
#  patient_id      :integer
#  admin_user      :integer
#  user_id         :integer
#  attachment      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  duration        :integer
#  name            :string
#  google_event_id :string
#  state           :string
#  reason_cancel   :text
#

class Appointment < ApplicationRecord
	belongs_to :patient
    before_save :end_date

	def end_date

		self.end_datetime = self.start_datetime + (self.duration*60)
        
		
	end
end
