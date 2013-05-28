require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get display" do
    get :display
    assert_response :success
  end

  test "should get get_tags" do
    get :get_tags
    assert_response :success
  end

  test "should get get_instagram" do
    get :get_instagram
    assert_response :success
  end

  test "should get get_tweets" do
    get :get_tweets
    assert_response :success
  end

end
