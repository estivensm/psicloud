require 'test_helper'

class FirstRipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first_rip = first_rips(:one)
  end

  test "should get index" do
    get first_rips_url
    assert_response :success
  end

  test "should get new" do
    get new_first_rip_url
    assert_response :success
  end

  test "should create first_rip" do
    assert_difference('FirstRip.count') do
      post first_rips_url, params: { first_rip: { codigo_dpto: @first_rip.codigo_dpto, codigo_entidad_admin: @first_rip.codigo_entidad_admin, codigo_municipio: @first_rip.codigo_municipio, edad: @first_rip.edad, numero_identificacion: @first_rip.numero_identificacion, primer_apellido: @first_rip.primer_apellido, primer_nombre: @first_rip.primer_nombre, segundo_apellido: @first_rip.segundo_apellido, segundo_nombre: @first_rip.segundo_nombre, sexo: @first_rip.sexo, tipo_identificacion: @first_rip.tipo_identificacion, tipo_usuario: @first_rip.tipo_usuario, unidad_medida_edad: @first_rip.unidad_medida_edad, zona_residencial: @first_rip.zona_residencial } }
    end

    assert_redirected_to first_rip_url(FirstRip.last)
  end

  test "should show first_rip" do
    get first_rip_url(@first_rip)
    assert_response :success
  end

  test "should get edit" do
    get edit_first_rip_url(@first_rip)
    assert_response :success
  end

  test "should update first_rip" do
    patch first_rip_url(@first_rip), params: { first_rip: { codigo_dpto: @first_rip.codigo_dpto, codigo_entidad_admin: @first_rip.codigo_entidad_admin, codigo_municipio: @first_rip.codigo_municipio, edad: @first_rip.edad, numero_identificacion: @first_rip.numero_identificacion, primer_apellido: @first_rip.primer_apellido, primer_nombre: @first_rip.primer_nombre, segundo_apellido: @first_rip.segundo_apellido, segundo_nombre: @first_rip.segundo_nombre, sexo: @first_rip.sexo, tipo_identificacion: @first_rip.tipo_identificacion, tipo_usuario: @first_rip.tipo_usuario, unidad_medida_edad: @first_rip.unidad_medida_edad, zona_residencial: @first_rip.zona_residencial } }
    assert_redirected_to first_rip_url(@first_rip)
  end

  test "should destroy first_rip" do
    assert_difference('FirstRip.count', -1) do
      delete first_rip_url(@first_rip)
    end

    assert_redirected_to first_rips_url
  end
end
