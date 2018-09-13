require 'test_helper'

class ClinichistoryConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clinichistory_config = clinichistory_configs(:one)
  end

  test "should get index" do
    get clinichistory_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_clinichistory_config_url
    assert_response :success
  end

  test "should create clinichistory_config" do
    assert_difference('ClinichistoryConfig.count') do
      post clinichistory_configs_url, params: { clinichistory_config: { admin_user: @clinichistory_config.admin_user, footer_image: @clinichistory_config.footer_image, footer_text: @clinichistory_config.footer_text, header_image: @clinichistory_config.header_image, header_text: @clinichistory_config.header_text, state: @clinichistory_config.state, user_id: @clinichistory_config.user_id } }
    end

    assert_redirected_to clinichistory_config_url(ClinichistoryConfig.last)
  end

  test "should show clinichistory_config" do
    get clinichistory_config_url(@clinichistory_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_clinichistory_config_url(@clinichistory_config)
    assert_response :success
  end

  test "should update clinichistory_config" do
    patch clinichistory_config_url(@clinichistory_config), params: { clinichistory_config: { admin_user: @clinichistory_config.admin_user, footer_image: @clinichistory_config.footer_image, footer_text: @clinichistory_config.footer_text, header_image: @clinichistory_config.header_image, header_text: @clinichistory_config.header_text, state: @clinichistory_config.state, user_id: @clinichistory_config.user_id } }
    assert_redirected_to clinichistory_config_url(@clinichistory_config)
  end

  test "should destroy clinichistory_config" do
    assert_difference('ClinichistoryConfig.count', -1) do
      delete clinichistory_config_url(@clinichistory_config)
    end

    assert_redirected_to clinichistory_configs_url
  end
end
