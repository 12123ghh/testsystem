require 'test_helper'

class OptionTest < ActiveSupport::TestCase
	test "#content" do
		option = Option.new(question_id: questions(:questionone))
		assert_not option.save, "content can not be blank"
	end

	test "content length" do
		option = Option.new(content: "contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent
			contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent", question_id: questions(:questionone))
		assert_not option.save, "maximum is 150"
	end

	test "content blank" do
		option = Option.new(question_id: questions(:questionone))
		assert_not option.save, "content blank"
	end

	test "question id blank" do
		option = Option.new(content: "content")
		assert_not option.save, "option id blank"
	end
	test "question id blank2" do
		option = Option.new(content: "content")
		assert_not option.save, "option id blank"
	end

	test "option blank" do
		option = Option.new
		assert_not option.save, "option  blank"
	end

	test "option blank2" do
		option = Option.new
		assert_not option.save, "option  blank"
	end

	test "should success create option" do
		option = Option.new(content: "content", question_id: questions(:questionone))
		assert option.save, "should success create option"
	end

	test "option belongs to question" do
		assert_instance_of Question, options(:optionone).question
	end
end
