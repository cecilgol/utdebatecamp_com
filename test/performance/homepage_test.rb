require 'test_helper'
require 'rails/performance_test_help'

class HomepageTest < ActionDispatch::PerformanceTest




  test "homepage" do
    get '/'
  end
end
