require 'test_helper'

class SidebarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sidebar_index_url
    assert_response :success
  end

end
