require 'test_helper'

class ToolTestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tool_tests_index_url
    assert_response :success
  end

  test "should get show" do
    get tool_tests_show_url
    assert_response :success
  end

  test "should get new" do
    get tool_tests_new_url
    assert_response :success
  end

  test "should get edit" do
    get tool_tests_edit_url
    assert_response :success
  end

end
