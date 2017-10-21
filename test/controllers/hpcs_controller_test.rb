require 'test_helper'

class HpcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hpc = hpcs(:one)
  end

  test "should get index" do
    get hpcs_url
    assert_response :success
  end

  test "should get new" do
    get new_hpc_url
    assert_response :success
  end

  test "should create hpc" do
    assert_difference('Hpc.count') do
      post hpcs_url, params: { hpc: { admin_user: @hpc.admin_user, description: @hpc.description, name: @hpc.name, user_id: @hpc.user_id } }
    end

    assert_redirected_to hpc_url(Hpc.last)
  end

  test "should show hpc" do
    get hpc_url(@hpc)
    assert_response :success
  end

  test "should get edit" do
    get edit_hpc_url(@hpc)
    assert_response :success
  end

  test "should update hpc" do
    patch hpc_url(@hpc), params: { hpc: { admin_user: @hpc.admin_user, description: @hpc.description, name: @hpc.name, user_id: @hpc.user_id } }
    assert_redirected_to hpc_url(@hpc)
  end

  test "should destroy hpc" do
    assert_difference('Hpc.count', -1) do
      delete hpc_url(@hpc)
    end

    assert_redirected_to hpcs_url
  end
end
