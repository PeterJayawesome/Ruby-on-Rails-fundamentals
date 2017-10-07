require 'test_helper'

class SayControllerTest < ActionController::TestCase
  test "should get hello" do
    get :hello
    assert_response :success
  end

  test "should get hello_to_joe" do
    get :hello_to_joe
    assert_response :success
  end

  test "should get hello_to_michael" do
    get :hello_to_michael
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
