require 'test_helper'

class ExamTest < ActiveSupport::TestCase

	test "calculate_score should be 0" do
		exam = Exam.new
		assert_equal 0, exam.calculate_score 
	end
  
	test "answers count should be 2" do
		assert_equal 2, exams(:examone).answers.count
	end

	test "right answers count should be 2" do
		assert_equal 2, exams(:examone).answers.right_answer.count
	end

	test "calculate_score should be 100" do
		assert_equal 100, exams(:examone).calculate_score
	end

	test "exam belongs to user" do
		assert_instance_of User, exams(:examone).user
	end

	test "exam belongs to paper" do
		assert_instance_of Paper, exams(:examone).paper
	end

	test "exam has many answers" do
		assert_instance_of Answer, exams(:examone).answers.first
	end

end