require 'test_helper'

class EmploymentsControllerTest < ActionController::TestCase
  setup do
    @employment = employments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employment" do
    assert_difference('Employment.count') do
      post :create, employment: { company: @employment.company, detail: @employment.detail, end_date: @employment.end_date, job_title: @employment.job_title, resume_id: @employment.resume_id, start_date: @employment.start_date }
    end

    assert_redirected_to employment_path(assigns(:employment))
  end

  test "should show employment" do
    get :show, id: @employment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employment
    assert_response :success
  end

  test "should update employment" do
    put :update, id: @employment, employment: { company: @employment.company, detail: @employment.detail, end_date: @employment.end_date, job_title: @employment.job_title, resume_id: @employment.resume_id, start_date: @employment.start_date }
    assert_redirected_to employment_path(assigns(:employment))
  end

  test "should destroy employment" do
    assert_difference('Employment.count', -1) do
      delete :destroy, id: @employment
    end

    assert_redirected_to employments_path
  end
end
