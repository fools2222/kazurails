require "test_helper"

class RubyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ruby_index_url
    assert_response :success
  end

  test "should get show" do
    get ruby_show_url
    assert_response :success
  end
end
