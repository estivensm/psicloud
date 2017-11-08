require 'test_helper'

class ChildGeneralDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @child_general_date = child_general_dates(:one)
  end

  test "should get index" do
    get child_general_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_child_general_date_url
    assert_response :success
  end

  test "should create child_general_date" do
    assert_difference('ChildGeneralDate.count') do
      post child_general_dates_url, params: { child_general_date: { account_id: @child_general_date.account_id, admin_user: @child_general_date.admin_user, father_addictions: @child_general_date.father_addictions, father_age: @child_general_date.father_age, father_birthday: @child_general_date.father_birthday, father_job: @child_general_date.father_job, father_name: @child_general_date.father_name, father_relationship: @child_general_date.father_relationship, mother_addictionsmother_relationship: @child_general_date.mother_addictionsmother_relationship, mother_age: @child_general_date.mother_age, mother_birthday: @child_general_date.mother_birthday, mother_job: @child_general_date.mother_job, mother_name: @child_general_date.mother_name, parents_reaction: @child_general_date.parents_reaction, parents_realationship: @child_general_date.parents_realationship, patient_id: @child_general_date.patient_id, reasons_relationship: @child_general_date.reasons_relationship, user_id: @child_general_date.user_id } }
    end

    assert_redirected_to child_general_date_url(ChildGeneralDate.last)
  end

  test "should show child_general_date" do
    get child_general_date_url(@child_general_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_child_general_date_url(@child_general_date)
    assert_response :success
  end

  test "should update child_general_date" do
    patch child_general_date_url(@child_general_date), params: { child_general_date: { account_id: @child_general_date.account_id, admin_user: @child_general_date.admin_user, father_addictions: @child_general_date.father_addictions, father_age: @child_general_date.father_age, father_birthday: @child_general_date.father_birthday, father_job: @child_general_date.father_job, father_name: @child_general_date.father_name, father_relationship: @child_general_date.father_relationship, mother_addictionsmother_relationship: @child_general_date.mother_addictionsmother_relationship, mother_age: @child_general_date.mother_age, mother_birthday: @child_general_date.mother_birthday, mother_job: @child_general_date.mother_job, mother_name: @child_general_date.mother_name, parents_reaction: @child_general_date.parents_reaction, parents_realationship: @child_general_date.parents_realationship, patient_id: @child_general_date.patient_id, reasons_relationship: @child_general_date.reasons_relationship, user_id: @child_general_date.user_id } }
    assert_redirected_to child_general_date_url(@child_general_date)
  end

  test "should destroy child_general_date" do
    assert_difference('ChildGeneralDate.count', -1) do
      delete child_general_date_url(@child_general_date)
    end

    assert_redirected_to child_general_dates_url
  end
end
