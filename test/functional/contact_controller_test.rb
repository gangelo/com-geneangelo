require 'test_helper'

class ContactControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get post" do
    get :post
    assert_response :success
  end

end
