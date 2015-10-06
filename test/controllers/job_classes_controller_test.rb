require 'test_helper'

class JobClassesControllerTest < ActionController::TestCase
=begin
  setup do
    @job_class = job_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_class" do
    assert_difference('JobClass.count') do
      post :create, job_class: {  }
    end

    assert_redirected_to job_class_path(assigns(:job_class))
  end

  test "should show job_class" do
    get :show, id: @job_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_class
    assert_response :success
  end

  test "should update job_class" do
    patch :update, id: @job_class, job_class: {  }
    assert_redirected_to job_class_path(assigns(:job_class))
  end

  test "should destroy job_class" do
    assert_difference('JobClass.count', -1) do
      delete :destroy, id: @job_class
    end

    assert_redirected_to job_classes_path
  end
=end
end
