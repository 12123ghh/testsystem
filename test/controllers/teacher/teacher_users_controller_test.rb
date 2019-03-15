require 'test_helper'

class Teacher::TeacherUsersControllerTest < ActionDispatch::IntegrationTest

  test "should get new_teacher_teacher_user_path" do
  	get new_teacher_teacher_user_path
  	assert_response :success
  end

  test "should create a teacher" do
  	post teacher_teacher_user_path, params: {user: {name: "teacherhuang", email: "teacherhuang@qq.com",
  	 password: "password", password_confirmation: "password"}}
  	assert_response :redirect
  end

  test "should get teacher_teacher_user_path" do
  	get teacher_teacher_user_path(users(:chendonghua))
  	assert_response :success, "should get teacher_teacher_user_path"
  end

  test "should get edit_teacher_teacher_user_path" do
  	get edit_teacher_teacher_user_path(users(:chendonghua))
  	assert_response :success, "should get edit_teacher_teacher_user_path"	
  end

  test "should update teacher" do
  	patch teacher_teacher_user_path(users(:chendonghua)), params: { user: {name: "donghua"}}
  	assert_redirected_to user_path(users(:chendonghua)), "redirect to teacher user path"
  	user.reload
  	assert_equal "donghua", users(:chendonghua).name, "change teacher name"
  end

end
