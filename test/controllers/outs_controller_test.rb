require 'test_helper'

class OutsControllerTest < ActionController::TestCase
=begin
  setup do
    @out = outs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create out" do
    assert_difference('Out.count') do
      post :create, out: {  }
    end

    assert_redirected_to out_path(assigns(:out))
  end

  test "should show out" do
    get :show, id: @out
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @out
    assert_response :success
  end

  test "should update out" do
    patch :update, id: @out, out: {  }
    assert_redirected_to out_path(assigns(:out))
  end

  test "should destroy out" do
    assert_difference('Out.count', -1) do
      delete :destroy, id: @out
    end

    assert_redirected_to outs_path
  end
=end
end
