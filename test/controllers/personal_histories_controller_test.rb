require 'test_helper'

class PersonalHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_history = personal_histories(:one)
  end

  test "should get index" do
    get personal_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_history_url
    assert_response :success
  end

  test "should create personal_history" do
    assert_difference('PersonalHistory.count') do
      post personal_histories_url, params: { personal_history: { accout_id: @personal_history.accout_id, admin_user: @personal_history.admin_user, biberon: @personal_history.biberon, clinic_history_id: @personal_history.clinic_history_id, dificultad_dormir: @personal_history.dificultad_dormir, dificultades_prenatales: @personal_history.dificultades_prenatales, edad_caminar: @personal_history.edad_caminar, edad_gateo: @personal_history.edad_gateo, edad_pie: @personal_history.edad_pie, embarazo: @personal_history.embarazo, enfermedades_medicas: @personal_history.enfermedades_medicas, hijo_deseado: @personal_history.hijo_deseado, hospitalizacion_cirugias: @personal_history.hospitalizacion_cirugias, inicio_lenguaje: @personal_history.inicio_lenguaje, latencia_materna: @personal_history.latencia_materna, parto: @personal_history.parto, patient_id: @personal_history.patient_id, periodo_prenatal: @personal_history.periodo_prenatal, peso_nacimiento: @personal_history.peso_nacimiento, problemas_alimentacion: @personal_history.problemas_alimentacion, problemas_visoperceptivomotores: @personal_history.problemas_visoperceptivomotores, reacciones: @personal_history.reacciones, semisolidos: @personal_history.semisolidos, solidos: @personal_history.solidos, talla_nacimiento: @personal_history.talla_nacimiento, user_id: @personal_history.user_id } }
    end

    assert_redirected_to personal_history_url(PersonalHistory.last)
  end

  test "should show personal_history" do
    get personal_history_url(@personal_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_history_url(@personal_history)
    assert_response :success
  end

  test "should update personal_history" do
    patch personal_history_url(@personal_history), params: { personal_history: { accout_id: @personal_history.accout_id, admin_user: @personal_history.admin_user, biberon: @personal_history.biberon, clinic_history_id: @personal_history.clinic_history_id, dificultad_dormir: @personal_history.dificultad_dormir, dificultades_prenatales: @personal_history.dificultades_prenatales, edad_caminar: @personal_history.edad_caminar, edad_gateo: @personal_history.edad_gateo, edad_pie: @personal_history.edad_pie, embarazo: @personal_history.embarazo, enfermedades_medicas: @personal_history.enfermedades_medicas, hijo_deseado: @personal_history.hijo_deseado, hospitalizacion_cirugias: @personal_history.hospitalizacion_cirugias, inicio_lenguaje: @personal_history.inicio_lenguaje, latencia_materna: @personal_history.latencia_materna, parto: @personal_history.parto, patient_id: @personal_history.patient_id, periodo_prenatal: @personal_history.periodo_prenatal, peso_nacimiento: @personal_history.peso_nacimiento, problemas_alimentacion: @personal_history.problemas_alimentacion, problemas_visoperceptivomotores: @personal_history.problemas_visoperceptivomotores, reacciones: @personal_history.reacciones, semisolidos: @personal_history.semisolidos, solidos: @personal_history.solidos, talla_nacimiento: @personal_history.talla_nacimiento, user_id: @personal_history.user_id } }
    assert_redirected_to personal_history_url(@personal_history)
  end

  test "should destroy personal_history" do
    assert_difference('PersonalHistory.count', -1) do
      delete personal_history_url(@personal_history)
    end

    assert_redirected_to personal_histories_url
  end
end
