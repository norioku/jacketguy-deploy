require 'test_helper'

class UserGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_genres_show_url
    assert_response :success
  end

end
