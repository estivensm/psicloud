# == Schema Information
#
# Table name: patients
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  second_name          :string
#  first_last_name      :string
#  second_last_name     :string
#  birth_date           :date
#  age                  :integer
#  document_type        :string
#  document             :string
#  occupation           :string
#  profession           :string
#  phone                :string
#  address              :string
#  email                :string
#  contact_name         :string
#  contact_phone        :string
#  contact_relationship :string
#  gender               :string
#  civil_status         :string
#  blood_type           :string
#  ethnic_group         :string
#  user_id              :integer
#  admin_user           :integer
#  count                :integer
#  agreement_id         :integer
#  avatar               :string
#  movil                :string
#  city                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  data                 :text
#  hpc_id               :integer
#  birthdate_month      :integer
#  birthdate_day        :integer
#  school_grade         :string
#  state                :boolean
#  firma_paciente       :text
#  firma_psicologo      :text
#  firma_madre          :text
#  firma_padre          :text
#  children             :string
#  number_children      :integer
#

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
