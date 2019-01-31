require 'test_helper'

class SecondRipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @second_rip = second_rips(:one)
  end

  test "should get index" do
    get second_rips_url
    assert_response :success
  end

  test "should get new" do
    get new_second_rip_url
    assert_response :success
  end

  test "should create second_rip" do
    assert_difference('SecondRip.count') do
      post second_rips_url, params: { second_rip: { admin_user: @second_rip.admin_user, administradora: @second_rip.administradora, codigo_entidad_administradora: @second_rip.codigo_entidad_administradora, codigo_prestador: @second_rip.codigo_prestador, fecha_expedicion_factura: @second_rip.fecha_expedicion_factura, fecha_final: @second_rip.fecha_final, fecha_inicio: @second_rip.fecha_inicio, nombre_entidad_: @second_rip.nombre_entidad_, numero_contrato: @second_rip.numero_contrato, numero_factura: @second_rip.numero_factura, numero_identificacion: @second_rip.numero_identificacion, numero_poliza: @second_rip.numero_poliza, plan_beneficiados: @second_rip.plan_beneficiados, tipo_identificacion: @second_rip.tipo_identificacion, user_id: @second_rip.user_id, valor_comision: @second_rip.valor_comision, valor_pagar_entidad: @second_rip.valor_pagar_entidad, valor_pago_compartido: @second_rip.valor_pago_compartido, valor_total_descuentos: @second_rip.valor_total_descuentos } }
    end

    assert_redirected_to second_rip_url(SecondRip.last)
  end

  test "should show second_rip" do
    get second_rip_url(@second_rip)
    assert_response :success
  end

  test "should get edit" do
    get edit_second_rip_url(@second_rip)
    assert_response :success
  end

  test "should update second_rip" do
    patch second_rip_url(@second_rip), params: { second_rip: { admin_user: @second_rip.admin_user, administradora: @second_rip.administradora, codigo_entidad_administradora: @second_rip.codigo_entidad_administradora, codigo_prestador: @second_rip.codigo_prestador, fecha_expedicion_factura: @second_rip.fecha_expedicion_factura, fecha_final: @second_rip.fecha_final, fecha_inicio: @second_rip.fecha_inicio, nombre_entidad_: @second_rip.nombre_entidad_, numero_contrato: @second_rip.numero_contrato, numero_factura: @second_rip.numero_factura, numero_identificacion: @second_rip.numero_identificacion, numero_poliza: @second_rip.numero_poliza, plan_beneficiados: @second_rip.plan_beneficiados, tipo_identificacion: @second_rip.tipo_identificacion, user_id: @second_rip.user_id, valor_comision: @second_rip.valor_comision, valor_pagar_entidad: @second_rip.valor_pagar_entidad, valor_pago_compartido: @second_rip.valor_pago_compartido, valor_total_descuentos: @second_rip.valor_total_descuentos } }
    assert_redirected_to second_rip_url(@second_rip)
  end

  test "should destroy second_rip" do
    assert_difference('SecondRip.count', -1) do
      delete second_rip_url(@second_rip)
    end

    assert_redirected_to second_rips_url
  end
end
