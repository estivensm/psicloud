require 'test_helper'

class ClinicHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clinic_history = clinic_histories(:one)
  end

  test "should get index" do
    get clinic_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_clinic_history_url
    assert_response :success
  end

  test "should create clinic_history" do
    assert_difference('ClinicHistory.count') do
      post clinic_histories_url, params: { clinic_history: { actual_state: @clinic_history.actual_state, admin_user: @clinic_history.admin_user, clinic_history_id: @clinic_history.clinic_history_id, consultation_reason: @clinic_history.consultation_reason, count: @clinic_history.count, description_appointment: @clinic_history.description_appointment, diagnostic_hypothesis: @clinic_history.diagnostic_hypothesis, frequency_appointment: @clinic_history.frequency_appointment, patient_id: @clinic_history.patient_id, quantity_appointment: @clinic_history.quantity_appointment, therapeutic_goal: @clinic_history.therapeutic_goal, type_of_treatment: @clinic_history.type_of_treatment, user_id: @clinic_history.user_id } }
    end

    assert_redirected_to clinic_history_url(ClinicHistory.last)
  end

  test "should show clinic_history" do
    get clinic_history_url(@clinic_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_clinic_history_url(@clinic_history)
    assert_response :success
  end

  test "should update clinic_history" do
    patch clinic_history_url(@clinic_history), params: { clinic_history: { actual_state: @clinic_history.actual_state, admin_user: @clinic_history.admin_user, clinic_history_id: @clinic_history.clinic_history_id, consultation_reason: @clinic_history.consultation_reason, count: @clinic_history.count, description_appointment: @clinic_history.description_appointment, diagnostic_hypothesis: @clinic_history.diagnostic_hypothesis, frequency_appointment: @clinic_history.frequency_appointment, patient_id: @clinic_history.patient_id, quantity_appointment: @clinic_history.quantity_appointment, therapeutic_goal: @clinic_history.therapeutic_goal, type_of_treatment: @clinic_history.type_of_treatment, user_id: @clinic_history.user_id } }
    assert_redirected_to clinic_history_url(@clinic_history)
  end

  test "should destroy clinic_history" do
    assert_difference('ClinicHistory.count', -1) do
      delete clinic_history_url(@clinic_history)
    end

    assert_redirected_to clinic_histories_url
  end
end
