require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
	test "answer belongs to exam" do
		answer = exams(:examone).answers.new
		assert_instance_of Exam, answer.exam
	end

	test "answer belongs to qustion" do
		answer = questions(:questionone).answers.new
		assert_instance_of Question, answer.question
	end

	test "option id can be blank" do
		answer = Answer.new(question: questions(:questionone), exam: exams(:examone))
		assert answer.save
	end
end