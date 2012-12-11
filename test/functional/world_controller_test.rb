require 'test_helper'

class WorldControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get by_population" do
    get :by_population
    assert_response :success
  end

  test "should get by_age" do
    get :by_age
    assert_response :success
  end

  test "should get by_required_service" do
    get :by_required_service
    assert_response :success
  end

end
