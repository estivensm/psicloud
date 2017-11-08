# == Schema Information
#
# Table name: personal_histories
#
#  id                              :integer          not null, primary key
#  embarazo                        :string
#  hijo_deseado                    :string
#  dificultades_prenatales         :text
#  periodo_prenatal                :string
#  parto                           :string
#  peso_nacimiento                 :float
#  talla_nacimiento                :float
#  latencia_materna                :integer
#  biberon                         :integer
#  semisolidos                     :string
#  solidos                         :string
#  problemas_alimentacion          :string
#  dificultad_dormir               :string
#  reacciones                      :string
#  edad_gateo                      :integer
#  edad_pie                        :integer
#  edad_caminar                    :integer
#  inicio_lenguaje                 :integer
#  enfermedades_medicas            :string
#  hospitalizacion_cirugias        :string
#  problemas_visoperceptivomotores :string
#  accout_id                       :integer
#  user_id                         :integer
#  admin_user                      :integer
#  patient_id                      :integer
#  clinic_history_id               :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

require 'test_helper'

class PersonalHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
