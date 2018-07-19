require 'test_helper'

class FrindsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get frinds_create_url
    assert_response :success
  end

  test "should get update" do
    get frinds_update_url
    assert_response :success
  end

  test "should get destroy" do
    get frinds_destroy_url
    assert_response :success
  end

end
