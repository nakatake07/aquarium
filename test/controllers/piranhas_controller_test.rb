require 'test_helper'

class PiranhasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get piranhas_index_url
    assert_response :success
  end

  test "should get show" do
    get piranhas_show_url
    assert_response :success
  end

  test "should get edit" do
    get piranhas_edit_url
    assert_response :success
  end

end
