# == Schema Information
#
# Table name: invoice_consultations
#
#  id                 :integer          not null, primary key
#  invoice_date       :date
#  invoice_number     :string
#  consultation_value :float
#  discount_value     :float
#  total_value        :float
#  comment            :text
#  appointment_id     :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class InvoiceConsultation < ApplicationRecord
	belongs_to :appointment
end
