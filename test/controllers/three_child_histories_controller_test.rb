require 'test_helper'

class ThreeChildHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @three_child_history = three_child_histories(:one)
  end

  test "should get index" do
    get three_child_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_three_child_history_url
    assert_response :success
  end

  test "should create three_child_history" do
    assert_difference('ThreeChildHistory.count') do
      post three_child_histories_url, params: { three_child_history: { aceptacion_noviazgo: @three_child_history.aceptacion_noviazgo, admini_user: @three_child_history.admini_user, clinic_history_id: @three_child_history.clinic_history_id, comportamientos_molestos: @three_child_history.comportamientos_molestos, conocimientos_sexualidad: @three_child_history.conocimientos_sexualidad, dejado_alimentacion: @three_child_history.dejado_alimentacion, descripcion_sintomas: @three_child_history.descripcion_sintomas, destete: @three_child_history.destete, duerme_con: @three_child_history.duerme_con, experiencia_menarquia: @three_child_history.experiencia_menarquia, experiencia_polucion: @three_child_history.experiencia_polucion, fue_informado: @three_child_history.fue_informado, gustos_alimentos: @three_child_history.gustos_alimentos, informacion_sexual: @three_child_history.informacion_sexual, masturbacion: @three_child_history.masturbacion, menarquia: @three_child_history.menarquia, noviazgo: @three_child_history.noviazgo, observaciones: @three_child_history.observaciones, patient_id: @three_child_history.patient_id, polucion: @three_child_history.polucion, reaccion_defecacion: @three_child_history.reaccion_defecacion, reacciones_emocionales: @three_child_history.reacciones_emocionales, responsable_disiplina: @three_child_history.responsable_disiplina, sintomas_neuroticos: @three_child_history.sintomas_neuroticos, succion_dedo: @three_child_history.succion_dedo, tipo_alimentacion: @three_child_history.tipo_alimentacion, tipos_de_castigo: @three_child_history.tipos_de_castigo, user_id: @three_child_history.user_id, visto_acto_sexual: @three_child_history.visto_acto_sexual } }
    end

    assert_redirected_to three_child_history_url(ThreeChildHistory.last)
  end

  test "should show three_child_history" do
    get three_child_history_url(@three_child_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_three_child_history_url(@three_child_history)
    assert_response :success
  end

  test "should update three_child_history" do
    patch three_child_history_url(@three_child_history), params: { three_child_history: { aceptacion_noviazgo: @three_child_history.aceptacion_noviazgo, admini_user: @three_child_history.admini_user, clinic_history_id: @three_child_history.clinic_history_id, comportamientos_molestos: @three_child_history.comportamientos_molestos, conocimientos_sexualidad: @three_child_history.conocimientos_sexualidad, dejado_alimentacion: @three_child_history.dejado_alimentacion, descripcion_sintomas: @three_child_history.descripcion_sintomas, destete: @three_child_history.destete, duerme_con: @three_child_history.duerme_con, experiencia_menarquia: @three_child_history.experiencia_menarquia, experiencia_polucion: @three_child_history.experiencia_polucion, fue_informado: @three_child_history.fue_informado, gustos_alimentos: @three_child_history.gustos_alimentos, informacion_sexual: @three_child_history.informacion_sexual, masturbacion: @three_child_history.masturbacion, menarquia: @three_child_history.menarquia, noviazgo: @three_child_history.noviazgo, observaciones: @three_child_history.observaciones, patient_id: @three_child_history.patient_id, polucion: @three_child_history.polucion, reaccion_defecacion: @three_child_history.reaccion_defecacion, reacciones_emocionales: @three_child_history.reacciones_emocionales, responsable_disiplina: @three_child_history.responsable_disiplina, sintomas_neuroticos: @three_child_history.sintomas_neuroticos, succion_dedo: @three_child_history.succion_dedo, tipo_alimentacion: @three_child_history.tipo_alimentacion, tipos_de_castigo: @three_child_history.tipos_de_castigo, user_id: @three_child_history.user_id, visto_acto_sexual: @three_child_history.visto_acto_sexual } }
    assert_redirected_to three_child_history_url(@three_child_history)
  end

  test "should destroy three_child_history" do
    assert_difference('ThreeChildHistory.count', -1) do
      delete three_child_history_url(@three_child_history)
    end

    assert_redirected_to three_child_histories_url
  end
end
