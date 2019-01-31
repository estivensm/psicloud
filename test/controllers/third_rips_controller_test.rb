require 'test_helper'

class ThirdRipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @third_rip = third_rips(:one)
  end

  test "should get index" do
    get third_rips_url
    assert_response :success
  end

  test "should get new" do
    get new_third_rip_url
    assert_response :success
  end

  test "should create third_rip" do
    assert_difference('ThirdRip.count') do
      post third_rips_url, params: { third_rip: { admin_user: @third_rip.admin_user, causa_externa: @third_rip.causa_externa, codigo_consulta: @third_rip.codigo_consulta, codigo_diagnostico: @third_rip.codigo_diagnostico, codigo_diagnostico_dos: @third_rip.codigo_diagnostico_dos, codigo_diagnostico_tres: @third_rip.codigo_diagnostico_tres, codigo_diagnostico_uno: @third_rip.codigo_diagnostico_uno, codigo_prestador: @third_rip.codigo_prestador, fecha_consulta: @third_rip.fecha_consulta, finalidad_consulta: @third_rip.finalidad_consulta, numero_autorizacion: @third_rip.numero_autorizacion, numero_factura: @third_rip.numero_factura, numero_identificacion_usuario: @third_rip.numero_identificacion_usuario, tipo_diagnostico_principal: @third_rip.tipo_diagnostico_principal, tipo_identificacion_usuario: @third_rip.tipo_identificacion_usuario, user_id: @third_rip.user_id, valor_consulta: @third_rip.valor_consulta, valor_cuota_moderadora: @third_rip.valor_cuota_moderadora, valor_neto_pagar: @third_rip.valor_neto_pagar } }
    end

    assert_redirected_to third_rip_url(ThirdRip.last)
  end

  test "should show third_rip" do
    get third_rip_url(@third_rip)
    assert_response :success
  end

  test "should get edit" do
    get edit_third_rip_url(@third_rip)
    assert_response :success
  end

  test "should update third_rip" do
    patch third_rip_url(@third_rip), params: { third_rip: { admin_user: @third_rip.admin_user, causa_externa: @third_rip.causa_externa, codigo_consulta: @third_rip.codigo_consulta, codigo_diagnostico: @third_rip.codigo_diagnostico, codigo_diagnostico_dos: @third_rip.codigo_diagnostico_dos, codigo_diagnostico_tres: @third_rip.codigo_diagnostico_tres, codigo_diagnostico_uno: @third_rip.codigo_diagnostico_uno, codigo_prestador: @third_rip.codigo_prestador, fecha_consulta: @third_rip.fecha_consulta, finalidad_consulta: @third_rip.finalidad_consulta, numero_autorizacion: @third_rip.numero_autorizacion, numero_factura: @third_rip.numero_factura, numero_identificacion_usuario: @third_rip.numero_identificacion_usuario, tipo_diagnostico_principal: @third_rip.tipo_diagnostico_principal, tipo_identificacion_usuario: @third_rip.tipo_identificacion_usuario, user_id: @third_rip.user_id, valor_consulta: @third_rip.valor_consulta, valor_cuota_moderadora: @third_rip.valor_cuota_moderadora, valor_neto_pagar: @third_rip.valor_neto_pagar } }
    assert_redirected_to third_rip_url(@third_rip)
  end

  test "should destroy third_rip" do
    assert_difference('ThirdRip.count', -1) do
      delete third_rip_url(@third_rip)
    end

    assert_redirected_to third_rips_url
  end
end
