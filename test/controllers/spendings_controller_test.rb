require 'test_helper'

class SpendingsControllerTest < ActionDispatch::IntegrationTest
  test "should get monthly" do
    get spendings_monthly_url
    assert_response :success
  end

end
