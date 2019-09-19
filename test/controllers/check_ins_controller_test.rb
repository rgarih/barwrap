require 'test_helper'

class CheckInsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get check_ins_new_url
    assert_response :success
  end

  test "should get create" do
    get check_ins_create_url
    assert_response :success
  end

  test "should get index" do
    get check_ins_index_url
    assert_response :success
  end

end
