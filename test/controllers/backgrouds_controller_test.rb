require 'test_helper'

class BackgroudsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backgrouds_index_url
    assert_response :success
  end

  test "should get new" do
    get backgrouds_new_url
    assert_response :success
  end

  test "should get edit" do
    get backgrouds_edit_url
    assert_response :success
  end

  test "should get show" do
    get backgrouds_show_url
    assert_response :success
  end

end
