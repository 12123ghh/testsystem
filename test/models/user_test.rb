require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "email validate1" do
		user = User.new(name: "test", email: "qwerasd", password: "password", password_confirmation: "password")
		assert_not user.save, "email should be validate"
	end
	test "email validate2" do
		user = User.new(name: "test", email: "a", password: "password", password_confirmation: "password")
		assert user.save, "email should be validate"
	end
	test "email validate3" do
		user = User.new(name: "test", email: "qw e rasd", password: "password", password_confirmation: "password")
		assert user.save, "email should be validate"
	end
	test "email validate4" do
		user = User.new(name: "test", email: "qwer//asd?", password: "password", password_confirmation: "password")
		assert user.save, "email should be validate"
	end

	test "user should had email" do
		user = User.new(name: "test", password: "password", password_confirmation: "password")
		assert_not user.save, "email can not be blank"
	end

	test "user colunm can be blank" do
		user = User.new(name: "test", email: "", password: "", password_confirmation: "password")
		assert_not user.save, "email should be validate"
	end

	test "email validate10" do
		user = User.new(name: "dawei", email: "dawei@163.com", password: "password", password_confirmation: "password")
		assert_not user.save, "email should be validate"
	end

	test "email validate11" do
		user = User.new(name: "chenxuan", email: "chenxuan@qq.com", password: "password", password_confirmation: "password")
		assert_not user.save, "email should be validate"
	end

	test "email should be downcase before save" do
		user = User.new(name: "test", email: "test@qq.com", password: "password", password_confirmation: "password")
		assert user.save
		assert_equal "test@qq.com", user.email, "email should be downcase before save"
	end

	test "email should be downcase before save 2" do
		user = User.new(name: "panchangjiang", email: "PanCAHGJIANG@qq.com", password: "password", password_confirmation: "password")
		assert user.save
		assert_equal "panchangjiang@qq.com", user.email, "email should be downcase before save"
	end

	test "user should has name" do
		user = User.new(email: "test@qq.com", password: "password", password_confirmation: "password")
		assert_not user.save, "user name can not be blank"
	end

	test "user should had password and password_confirmation" do
		user = User.new(name: "test", email: "test@qq.com")
		assert_not user.save, "user should had password adn password_confirmation"
	end
	test "create user" do
		user = User.new(name: "daweili", email: "daweili@163.com", password: "password", password_confirmation: "password")
		assert_not user.save, "email should be validate"
	end

	test "create lidawei" do
		user = User.new(name: "lidawei", email: "lidawei@163.com", password: "password", password_confirmation: "password")
		assert_not user.save, "email should be validate"
	end

	test "user message null" do
		user = User.new()
		assert_not user.save, "user message null"		
	end

	test "user#email" do
		assert users(:huangjingxian).email
	end
end
