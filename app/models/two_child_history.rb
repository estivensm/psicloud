# == Schema Information
#
# Table name: two_child_histories
#
#  id                     :integer          not null, primary key
#  nivel_escolar          :string
#  indice_academico       :string
#  escuela                :string
#  adaptacion_escolar     :string
#  problemas_escolares    :string
#  gustos_escolares       :string
#  disgustos_escolares    :string
#  tareas                 :string
#  utiles_escolares       :string
#  problemas_materias     :string
#  relacion_maestro       :string
#  relacion_companeros    :string
#  frecuencia_amigos      :string
#  edad_amigos            :string
#  tipo_juegos            :string
#  actividades_mismo_sexo :string
#  actividades_otro_sexo  :string
#  pelea                  :string
#  motivo_felicidad       :string
#  motivo_tristeza        :string
#  motivo_enojo           :string
#  motivos_pregunta       :string
#  habitos                :string
#  admin_user             :integer
#  user_id                :integer
#  patient_id             :integer
#  clinic_history_id      :integer
#  tiempo_libre           :string
#  hace_solo              :string
#  no_gusta               :string
#  deportes               :string
#  juegos                 :string
#  programa_tv            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class TwoChildHistory < ApplicationRecord
	belongs_to :clinic_history
end
