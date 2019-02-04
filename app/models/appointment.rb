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
    has_many :tasks
    before_save :end_date
    has_one :invoice_consultation
    

    scope :abiertas, -> { where('state=? OR state=?', 'Vigente', 'Vencida') }
    scope :cerradas, -> { where('state=? OR state=? OR state=?', 'Realizada', 'Cancelada', 'No Asistio') }

	def end_date

		self.end_datetime = self.start_datetime + (self.duration*60)
        
		
	end

	def self.search(search, search1)
        puts search1
        puts "holaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
		search != " " && search != "" && search != nil ?  (scope :nombre_scope, -> { where(patient_id: search)}) : (scope :nombre_scope, -> { where.not(id: nil)})
		search1 != " " && search1 != nil && search1 != "" ?  (scope :fecha_scope, -> { where("DATE(start_datetime) = ?",search1)}) : (scope :fecha_scope, -> { where.not(id: nil)})
		nombre_scope.fecha_scope

	end
	
end
