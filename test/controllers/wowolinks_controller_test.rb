require 'test_helper'

class WowolinksControllerTest < ActionController::TestCase
=begin
  setup do
    @wowolink = wowolinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wowolinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wowolink" do
    assert_difference('Wowolink.count') do
      post :create, wowolink: {  }
    end

    assert_redirected_to wowolink_path(assigns(:wowolink))
  end

  test "should show wowolink" do
    get :show, id: @wowolink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wowolink
    assert_response :success
  end

  test "should update wowolink" do
    patch :update, id: @wowolink, wowolink: {  }
    assert_redirected_to wowolink_path(assigns(:wowolink))
  end

  test "should destroy wowolink" do
    assert_difference('Wowolink.count', -1) do
      delete :destroy, id: @wowolink
    end

    assert_redirected_to wowolinks_path
  end
=end
end
