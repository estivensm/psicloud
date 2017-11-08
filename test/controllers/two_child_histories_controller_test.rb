require 'test_helper'

class TwoChildHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @two_child_history = two_child_histories(:one)
  end

  test "should get index" do
    get two_child_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_two_child_history_url
    assert_response :success
  end

  test "should create two_child_history" do
    assert_difference('TwoChildHistory.count') do
      post two_child_histories_url, params: { two_child_history: { actividades_mismo_sexo: @two_child_history.actividades_mismo_sexo, actividades_otro_sexo: @two_child_history.actividades_otro_sexo, adaptacion_escolar: @two_child_history.adaptacion_escolar, admin_user: @two_child_history.admin_user, clinic_history_id: @two_child_history.clinic_history_id, disgustos_escolares: @two_child_history.disgustos_escolares, edad_amigos: @two_child_history.edad_amigos, escuela: @two_child_history.escuela, frecuencia_amigos: @two_child_history.frecuencia_amigos, gustos_escolares: @two_child_history.gustos_escolares, habitos: @two_child_history.habitos, indice_academico: @two_child_history.indice_academico, motivo_enojo: @two_child_history.motivo_enojo, motivo_felicidad: @two_child_history.motivo_felicidad, motivo_tristeza: @two_child_history.motivo_tristeza, motivos_pregunta: @two_child_history.motivos_pregunta, nivel_escolar: @two_child_history.nivel_escolar, patient_id: @two_child_history.patient_id, pelea: @two_child_history.pelea, problemas_escolares: @two_child_history.problemas_escolares, problemas_materias: @two_child_history.problemas_materias, relacion_companeros: @two_child_history.relacion_companeros, relacion_maestro: @two_child_history.relacion_maestro, tareas: @two_child_history.tareas, tipo_juegos: @two_child_history.tipo_juegos, user_id: @two_child_history.user_id, utiles_escolares: @two_child_history.utiles_escolares } }
    end

    assert_redirected_to two_child_history_url(TwoChildHistory.last)
  end

  test "should show two_child_history" do
    get two_child_history_url(@two_child_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_two_child_history_url(@two_child_history)
    assert_response :success
  end

  test "should update two_child_history" do
    patch two_child_history_url(@two_child_history), params: { two_child_history: { actividades_mismo_sexo: @two_child_history.actividades_mismo_sexo, actividades_otro_sexo: @two_child_history.actividades_otro_sexo, adaptacion_escolar: @two_child_history.adaptacion_escolar, admin_user: @two_child_history.admin_user, clinic_history_id: @two_child_history.clinic_history_id, disgustos_escolares: @two_child_history.disgustos_escolares, edad_amigos: @two_child_history.edad_amigos, escuela: @two_child_history.escuela, frecuencia_amigos: @two_child_history.frecuencia_amigos, gustos_escolares: @two_child_history.gustos_escolares, habitos: @two_child_history.habitos, indice_academico: @two_child_history.indice_academico, motivo_enojo: @two_child_history.motivo_enojo, motivo_felicidad: @two_child_history.motivo_felicidad, motivo_tristeza: @two_child_history.motivo_tristeza, motivos_pregunta: @two_child_history.motivos_pregunta, nivel_escolar: @two_child_history.nivel_escolar, patient_id: @two_child_history.patient_id, pelea: @two_child_history.pelea, problemas_escolares: @two_child_history.problemas_escolares, problemas_materias: @two_child_history.problemas_materias, relacion_companeros: @two_child_history.relacion_companeros, relacion_maestro: @two_child_history.relacion_maestro, tareas: @two_child_history.tareas, tipo_juegos: @two_child_history.tipo_juegos, user_id: @two_child_history.user_id, utiles_escolares: @two_child_history.utiles_escolares } }
    assert_redirected_to two_child_history_url(@two_child_history)
  end

  test "should destroy two_child_history" do
    assert_difference('TwoChildHistory.count', -1) do
      delete two_child_history_url(@two_child_history)
    end

    assert_redirected_to two_child_histories_url
  end
end
