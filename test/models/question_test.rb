require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
	test "test has many options" do
		assert_instance_of Option, questions(:questionone).options.first, "question has many options"
	end
end
