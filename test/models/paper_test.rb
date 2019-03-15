require 'test_helper'

class PaperTest < ActiveSupport::TestCase
  test "paper belongs to creator" do
  	assert_instance_of User, papers(:paperone).creator
  end

  test "paper belongs to subject" do
  	assert_instance_of Subject, papers(:paperone).subject
  end

  test "should create paper error" do
  	paper = Paper.new(question_number: 10)
  	assert_not paper.save, "should ceate paper error"
  end

  test "should create paper error title blank" do
  	paper = Paper.new(subject: subjects(:english), question_number: 10)
  	assert_not paper.save, "title is blank"
  end

  test "should create paper error title too long" do
  	paper = Paper.new(title: "dsadasdzcczczcczcxxxxxxxxxxxxxxxxxxxxxxccccccxxxxxxxxxxxxxxxxxxxxxxx
  		ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccxxxxxxxxxxxxxx
  		xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  		xxxxxkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", subject: subjects(:english), question_number: 10)
  	assert_not paper.save, "title is too long"
  end

  test "should create paper error subject blank" do
  	paper = Paper.new(title: "kaoshi", question_number: 10)
  	assert_not paper.save, "subject is blank"
  end

  test "should create paper error questions number blank" do
  	paper = Paper.new(title: "titltlsad", subject: subjects(:english), question_number: 10)
  	assert_not paper.save, "questions number is blank"
  end

  test "should create paper " do
  	paper = Paper.new(title: "shijuan", subject: subjects(:english), question_number: 10)
  	assert_not paper.save, "questions number is blank"
  end

end
