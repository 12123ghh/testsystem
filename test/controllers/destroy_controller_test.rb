require 'test_helper'

class DestroyControllerTest < ActionDispatch::IntegrationTest
  test "should get teacher::papers" do
    get destroy_teacher::papers_url
    assert_response :success
  end

end
