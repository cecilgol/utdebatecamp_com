require 'test_helper'

class AccountTest < ActiveSupport::TestCase

    test "rejects no first_name" do
        account = Account.new
        assert_not account.save
    end

end
