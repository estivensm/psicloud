# == Schema Information
#
# Table name: tasks
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  admin_user       :integer
#  patient_id       :integer
#  description      :text
#  fecha_compromiso :date
#  appointment_id   :integer
#  estado           :boolean
#  fecha_entrega    :date
#  cumplimiento     :boolean
#  file             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Task < ApplicationRecord

    belongs_to :patient
    belongs_to :appointment , optional: true

    scope :abiertas, -> { where(estado: false) }
    scope :cerradas, -> { where(estado: true) }
end
