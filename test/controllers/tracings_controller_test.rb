require 'test_helper'

class TracingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tracing = tracings(:one)
  end

  test "should get index" do
    get tracings_url
    assert_response :success
  end

  test "should get new" do
    get new_tracing_url
    assert_response :success
  end

  test "should create tracing" do
    assert_difference('Tracing.count') do
      post tracings_url, params: { tracing: { admin_user: @tracing.admin_user, attachment: @tracing.attachment, clinic_history_id: @tracing.clinic_history_id, description: @tracing.description, patient_id: @tracing.patient_id, tracing_type: @tracing.tracing_type, user_id: @tracing.user_id } }
    end

    assert_redirected_to tracing_url(Tracing.last)
  end

  test "should show tracing" do
    get tracing_url(@tracing)
    assert_response :success
  end

  test "should get edit" do
    get edit_tracing_url(@tracing)
    assert_response :success
  end

  test "should update tracing" do
    patch tracing_url(@tracing), params: { tracing: { admin_user: @tracing.admin_user, attachment: @tracing.attachment, clinic_history_id: @tracing.clinic_history_id, description: @tracing.description, patient_id: @tracing.patient_id, tracing_type: @tracing.tracing_type, user_id: @tracing.user_id } }
    assert_redirected_to tracing_url(@tracing)
  end

  test "should destroy tracing" do
    assert_difference('Tracing.count', -1) do
      delete tracing_url(@tracing)
    end

    assert_redirected_to tracings_url
  end
end
