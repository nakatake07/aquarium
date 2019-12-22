require 'test_helper'

class BuyerinquiresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get buyerinquires_new_url
    assert_response :success
  end

end
