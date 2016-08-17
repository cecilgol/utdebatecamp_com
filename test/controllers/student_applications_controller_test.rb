require 'test_helper'

class StudentApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_application = student_applications(:one)
  end

  test "should get index" do
    get student_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_student_application_url
    assert_response :success
  end

  test "should create student_application" do
    assert_difference('StudentApplication.count') do
      post student_applications_url, params: { student_application: {  } }
    end

    assert_redirected_to student_application_url(StudentApplication.last)
  end

  test "should show student_application" do
    get student_application_url(@student_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_application_url(@student_application)
    assert_response :success
  end

  test "should update student_application" do
    patch student_application_url(@student_application), params: { student_application: {  } }
    assert_redirected_to student_application_url(@student_application)
  end

  test "should destroy student_application" do
    assert_difference('StudentApplication.count', -1) do
      delete student_application_url(@student_application)
    end

    assert_redirected_to student_applications_url
  end
end
