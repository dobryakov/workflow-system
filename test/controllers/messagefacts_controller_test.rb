require 'test_helper'

class MessagefactsControllerTest < ActionController::TestCase
=begin
  setup do
    @messagefact = messagefacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messagefacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create messagefact" do
    assert_difference('Messagefact.count') do
      post :create, messagefact: {  }
    end

    assert_redirected_to messagefact_path(assigns(:messagefact))
  end

  test "should show messagefact" do
    get :show, id: @messagefact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @messagefact
    assert_response :success
  end

  test "should update messagefact" do
    patch :update, id: @messagefact, messagefact: {  }
    assert_redirected_to messagefact_path(assigns(:messagefact))
  end

  test "should destroy messagefact" do
    assert_difference('Messagefact.count', -1) do
      delete :destroy, id: @messagefact
    end

    assert_redirected_to messagefacts_path
  end
=end
end
