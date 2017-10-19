class Appointment < ApplicationRecord
	belongs_to :patient
    before_save :end_date

	def end_date

		self.end_datetime = self.start_datetime + (self.duration*60)
        
		
	end
end
