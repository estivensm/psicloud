require 'test_helper'

class RolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rol = rols(:one)
  end

  test "should get index" do
    get rols_url
    assert_response :success
  end

  test "should get new" do
    get new_rol_url
    assert_response :success
  end

  test "should create rol" do
    assert_difference('Rol.count') do
      post rols_url, params: { rol: { admin_user: @rol.admin_user, configuracion: @rol.configuracion, create_cita: @rol.create_cita, create_doc: @rol.create_doc, create_hc: @rol.create_hc, create_patient: @rol.create_patient, create_rol: @rol.create_rol, create_user: @rol.create_user, delete_cita: @rol.delete_cita, delete_doc: @rol.delete_doc, delete_hc: @rol.delete_hc, delete_patient: @rol.delete_patient, delete_rol: @rol.delete_rol, delete_user: @rol.delete_user, description: @rol.description, edit_cita: @rol.edit_cita, edit_doc: @rol.edit_doc, edit_hc: @rol.edit_hc, edit_patient: @rol.edit_patient, edit_rol: @rol.edit_rol, edit_user: @rol.edit_user, name: @rol.name, show_cita: @rol.show_cita, show_doc: @rol.show_doc, show_hc: @rol.show_hc, show_patient: @rol.show_patient, show_rol: @rol.show_rol, show_user: @rol.show_user, user_id: @rol.user_id } }
    end

    assert_redirected_to rol_url(Rol.last)
  end

  test "should show rol" do
    get rol_url(@rol)
    assert_response :success
  end

  test "should get edit" do
    get edit_rol_url(@rol)
    assert_response :success
  end

  test "should update rol" do
    patch rol_url(@rol), params: { rol: { admin_user: @rol.admin_user, configuracion: @rol.configuracion, create_cita: @rol.create_cita, create_doc: @rol.create_doc, create_hc: @rol.create_hc, create_patient: @rol.create_patient, create_rol: @rol.create_rol, create_user: @rol.create_user, delete_cita: @rol.delete_cita, delete_doc: @rol.delete_doc, delete_hc: @rol.delete_hc, delete_patient: @rol.delete_patient, delete_rol: @rol.delete_rol, delete_user: @rol.delete_user, description: @rol.description, edit_cita: @rol.edit_cita, edit_doc: @rol.edit_doc, edit_hc: @rol.edit_hc, edit_patient: @rol.edit_patient, edit_rol: @rol.edit_rol, edit_user: @rol.edit_user, name: @rol.name, show_cita: @rol.show_cita, show_doc: @rol.show_doc, show_hc: @rol.show_hc, show_patient: @rol.show_patient, show_rol: @rol.show_rol, show_user: @rol.show_user, user_id: @rol.user_id } }
    assert_redirected_to rol_url(@rol)
  end

  test "should destroy rol" do
    assert_difference('Rol.count', -1) do
      delete rol_url(@rol)
    end

    assert_redirected_to rols_url
  end
end
