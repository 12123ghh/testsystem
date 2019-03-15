require 'test_helper'

class PapersControllerTest < ActionDispatch::IntegrationTest
	test "papers index" do
		get papers_path
		assert_response :success
	end

	test "student create examination" do
		user = users(:huangjingxian)
		paper = papers(:paperone)
		post create_exam_paper_path(user), params: {exam: {user: user,paper: paper}}
		assert_response :redirect, "student create examination "
	end
end
