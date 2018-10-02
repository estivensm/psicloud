require 'test_helper'

class CreatedFormatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @created_format = created_formats(:one)
  end

  test "should get index" do
    get created_formats_url
    assert_response :success
  end

  test "should get new" do
    get new_created_format_url
    assert_response :success
  end

  test "should create created_format" do
    assert_difference('CreatedFormat.count') do
      post created_formats_url, params: { created_format: { admin_user: @created_format.admin_user, description: @created_format.description, format: @created_format.format, name: @created_format.name, user_id: @created_format.user_id } }
    end

    assert_redirected_to created_format_url(CreatedFormat.last)
  end

  test "should show created_format" do
    get created_format_url(@created_format)
    assert_response :success
  end

  test "should get edit" do
    get edit_created_format_url(@created_format)
    assert_response :success
  end

  test "should update created_format" do
    patch created_format_url(@created_format), params: { created_format: { admin_user: @created_format.admin_user, description: @created_format.description, format: @created_format.format, name: @created_format.name, user_id: @created_format.user_id } }
    assert_redirected_to created_format_url(@created_format)
  end

  test "should destroy created_format" do
    assert_difference('CreatedFormat.count', -1) do
      delete created_format_url(@created_format)
    end

    assert_redirected_to created_formats_url
  end
end
