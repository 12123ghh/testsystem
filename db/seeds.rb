# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.admin.create!(email: "admin@example.com", password: "password", name: "admin")
User.teacher.create!(email: "teacher@example.com", password: "password", name: "teacher")
User.student.create!(email: "student@example.com", password: "password", name: "student")

admin = User.admin.find_by(email: "admin@example.com")
teacher = User.teacher.find_by(email: "teacher@example.com")
student = User.student.find_by(email: "student@example.com")

subject = Subject.create!(name: "语文")
Subject.create!(name: "数学")
Subject.create!(name: "英语")

Question.levels.keys.each do |level|
  20.times do |q_t|
    question = Question.create!(
      subject: subject,
      title: "【#{subject.name}】#{level}_考试试题_#{q_t+1}",
      level: level)

    question.options.create!([
      {content: "答案_1", is_right_answer: true},
      {content: "答案_2"},
      {content: "答案_3"},
      {content: "答案_4"}
    ])
  end
end

Paper.levels.keys.each do |level|
  paper = Paper.create!(
    subject: subject,
    level: level,
    question_number: 20,
    total_points: 100,
    creator: teacher,
    title: "【#{subject.name}】#{level}_考试试卷")

  paper.generate_questions
end

Exam.create!(user: student, paper: Paper.first)

exam = student.exams.first
Paper.first.questions.each do |q|
  exam.answers.create!(question: q, option: q.options.first)
end
