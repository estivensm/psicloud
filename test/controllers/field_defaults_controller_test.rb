require 'test_helper'

class FieldDefaultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @field_default = field_defaults(:one)
  end

  test "should get index" do
    get field_defaults_url
    assert_response :success
  end

  test "should get new" do
    get new_field_default_url
    assert_response :success
  end

  test "should create field_default" do
    assert_difference('FieldDefault.count') do
      post field_defaults_url, params: { field_default: { account_id: @field_default.account_id, admin_user: @field_default.admin_user, description_tracing_state: @field_default.description_tracing_state, evolution_tracing_state: @field_default.evolution_tracing_state, observation_tracing_state: @field_default.observation_tracing_state, user_id: @field_default.user_id } }
    end

    assert_redirected_to field_default_url(FieldDefault.last)
  end

  test "should show field_default" do
    get field_default_url(@field_default)
    assert_response :success
  end

  test "should get edit" do
    get edit_field_default_url(@field_default)
    assert_response :success
  end

  test "should update field_default" do
    patch field_default_url(@field_default), params: { field_default: { account_id: @field_default.account_id, admin_user: @field_default.admin_user, description_tracing_state: @field_default.description_tracing_state, evolution_tracing_state: @field_default.evolution_tracing_state, observation_tracing_state: @field_default.observation_tracing_state, user_id: @field_default.user_id } }
    assert_redirected_to field_default_url(@field_default)
  end

  test "should destroy field_default" do
    assert_difference('FieldDefault.count', -1) do
      delete field_default_url(@field_default)
    end

    assert_redirected_to field_defaults_url
  end
end
