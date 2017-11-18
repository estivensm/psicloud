# == Schema Information
#
# Table name: three_child_histories
#
#  id                       :integer          not null, primary key
#  destete                  :string
#  gustos_alimentos         :string
#  dejado_alimentacion      :string
#  tipo_alimentacion        :string
#  reaccion_defecacion      :string
#  succion_dedo             :string
#  masturbacion             :string
#  duerme_con               :string
#  visto_acto_sexual        :string
#  conocimientos_sexualidad :string
#  informacion_sexual       :string
#  menarquia                :integer
#  experiencia_menarquia    :string
#  polucion                 :integer
#  experiencia_polucion     :string
#  fue_informado            :string
#  reacciones_emocionales   :string
#  noviazgo                 :string
#  aceptacion_noviazgo      :string
#  sintomas_neuroticos      :string
#  descripcion_sintomas     :string
#  responsable_disiplina    :string
#  comportamientos_molestos :string
#  tipos_de_castigo         :string
#  observaciones            :string
#  user_id                  :integer
#  admin_user               :integer
#  patient_id               :integer
#  clinic_history_id        :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class ThreeChildHistory < ApplicationRecord
	belongs_to :clinic_history
end
