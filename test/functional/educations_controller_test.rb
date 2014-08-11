require 'test_helper'

class EducationsControllerTest < ActionController::TestCase
  setup do
    @education = educations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:educations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create education" do
    assert_difference('Education.count') do
      post :create, education: { degree: @education.degree, detail: @education.detail, end_date: @education.end_date, field_of_study: @education.field_of_study, institution: @education.institution, resume_id: @education.resume_id, start_date: @education.start_date }
    end

    assert_redirected_to education_path(assigns(:education))
  end

  test "should show education" do
    get :show, id: @education
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @education
    assert_response :success
  end

  test "should update education" do
    put :update, id: @education, education: { degree: @education.degree, detail: @education.detail, end_date: @education.end_date, field_of_study: @education.field_of_study, institution: @education.institution, resume_id: @education.resume_id, start_date: @education.start_date }
    assert_redirected_to education_path(assigns(:education))
  end

  test "should destroy education" do
    assert_difference('Education.count', -1) do
      delete :destroy, id: @education
    end

    assert_redirected_to educations_path
  end
end
