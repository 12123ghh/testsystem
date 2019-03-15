require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "get to signup path" do
    get signup_path
    assert_response :success
  end

  test "should create user" do
  	post user_path, params:{user: {name: "chen", email: "chen@163.com", 
  		password: "password", password_confirmation: "password_confirmation"}}
  	assert_response :redirect
  end

  test "show user" do
  	user = users(:huangjingxian)
  	get user_path(user)
  	assert_response :success, "show user"
  end

  test "edit user" do
  	get user_edit_path(users(:huangjingxian))
  	assert_response :redirect
  end

  test "update user" do
  	user = users(:huangjingxian)
  	patch user_path(user), params: {user: {name: "jingxian"}}
  	assert_redirected_to user_path(user), "redirect to user path"
  	user.reload
  	assert_equal "jingxian", user.name, "user name change"
  end
end
