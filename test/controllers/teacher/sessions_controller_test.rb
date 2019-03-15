require 'test_helper'

class Teacher::SessionsControllerTest < ActionDispatch::IntegrationTest
	test "should get new_teacher_session_path" do
		get new_teacher_session_path
		assert_response :success
	end

end
