# == Schema Information
#
# Table name: rols
#
#  id               :integer          not null, primary key
#  show_user        :boolean
#  create_user      :boolean
#  edit_user        :boolean
#  delete_user      :boolean
#  show_patient     :boolean
#  create_patient   :boolean
#  edit_patient     :boolean
#  delete_patient   :boolean
#  show_hc          :boolean
#  create_hc        :boolean
#  edit_hc          :boolean
#  delete_hc        :boolean
#  show_cita        :boolean
#  create_cita      :boolean
#  edit_cita        :boolean
#  delete_cita      :boolean
#  show_doc         :boolean
#  create_doc       :boolean
#  edit_doc         :boolean
#  delete_doc       :boolean
#  show_rol         :boolean
#  create_rol       :boolean
#  edit_rol         :boolean
#  delete_rol       :boolean
#  configuracion    :boolean
#  admin_user       :integer
#  user_id          :integer
#  name             :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  default          :boolean
#  show_all_user    :boolean
#  show_all_patient :boolean
#  show_all_hc      :boolean
#  show_all_cita    :boolean
#  show_all_doc     :boolean
#  show_all_rol     :boolean
#

class Rol < ApplicationRecord
	has_many :users
end
