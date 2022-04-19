require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
   test "root_test" do
      get root_path
      assert true
   end
end
