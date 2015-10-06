require 'test_helper'

class WorkpointsControllerTest < ActionController::TestCase
=begin
  setup do
    @workpoint = workpoints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workpoints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workpoint" do
    assert_difference('Workpoint.count') do
      post :create, workpoint: {  }
    end

    assert_redirected_to workpoint_path(assigns(:workpoint))
  end

  test "should show workpoint" do
    get :show, id: @workpoint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workpoint
    assert_response :success
  end

  test "should update workpoint" do
    patch :update, id: @workpoint, workpoint: {  }
    assert_redirected_to workpoint_path(assigns(:workpoint))
  end

  test "should destroy workpoint" do
    assert_difference('Workpoint.count', -1) do
      delete :destroy, id: @workpoint
    end

    assert_redirected_to workpoints_path
  end
=end
end
