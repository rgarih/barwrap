require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get dashboard_profile_url
    assert_response :success
  end

  test "should get edit" do
    get dashboard_edit_url
    assert_response :success
  end

  test "should get update" do
    get dashboard_update_url
    assert_response :success
  end

end
