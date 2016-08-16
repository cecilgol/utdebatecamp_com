require 'test_helper'

class EmployeeApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employee_applications_new_url
    assert_response :success
  end

  test "should get edit" do
    get employee_applications_edit_url
    assert_response :success
  end

  test "should get show" do
    get employee_applications_show_url
    assert_response :success
  end

  test "should get index" do
    get employee_applications_index_url
    assert_response :success
  end

  test "should get create" do
    get employee_applications_create_url
    assert_response :success
  end

  test "should get update" do
    get employee_applications_update_url
    assert_response :success
  end

end
