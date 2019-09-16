require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get map" do
    get places_map_url
    assert_response :success
  end

  test "should get index" do
    get places_index_url
    assert_response :success
  end

  test "should get recommended" do
    get places_recommended_url
    assert_response :success
  end

  test "should get checkin" do
    get places_checkin_url
    assert_response :success
  end

end
