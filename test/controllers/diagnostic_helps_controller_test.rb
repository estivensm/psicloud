require 'test_helper'

class DiagnosticHelpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diagnostic_help = diagnostic_helps(:one)
  end

  test "should get index" do
    get diagnostic_helps_url
    assert_response :success
  end

  test "should get new" do
    get new_diagnostic_help_url
    assert_response :success
  end

  test "should create diagnostic_help" do
    assert_difference('DiagnosticHelp.count') do
      post diagnostic_helps_url, params: { diagnostic_help: { admin_user: @diagnostic_help.admin_user, clinic_history_id: @diagnostic_help.clinic_history_id, description: @diagnostic_help.description, name: @diagnostic_help.name, patient_id: @diagnostic_help.patient_id, type_document: @diagnostic_help.type_document, user_id: @diagnostic_help.user_id } }
    end

    assert_redirected_to diagnostic_help_url(DiagnosticHelp.last)
  end

  test "should show diagnostic_help" do
    get diagnostic_help_url(@diagnostic_help)
    assert_response :success
  end

  test "should get edit" do
    get edit_diagnostic_help_url(@diagnostic_help)
    assert_response :success
  end

  test "should update diagnostic_help" do
    patch diagnostic_help_url(@diagnostic_help), params: { diagnostic_help: { admin_user: @diagnostic_help.admin_user, clinic_history_id: @diagnostic_help.clinic_history_id, description: @diagnostic_help.description, name: @diagnostic_help.name, patient_id: @diagnostic_help.patient_id, type_document: @diagnostic_help.type_document, user_id: @diagnostic_help.user_id } }
    assert_redirected_to diagnostic_help_url(@diagnostic_help)
  end

  test "should destroy diagnostic_help" do
    assert_difference('DiagnosticHelp.count', -1) do
      delete diagnostic_help_url(@diagnostic_help)
    end

    assert_redirected_to diagnostic_helps_url
  end
end
