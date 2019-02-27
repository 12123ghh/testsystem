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

Paper.create!(subject: "数学", question_number: 20, total_points: 100, title: "数学考试", creator: teacher)

paper = Paper.find_by(title: "数学考试")
20.times do |t|
  question = paper.questions.create!({
    title: "数学考试试题_#{t+1}",
  })

  question.options.create!([
    {content: "试题_#{t+1}_答案_1", is_right_answer: true},
    {content: "试题_#{t+1}_答案_2"},
    {content: "试题_#{t+1}_答案_3"},
    {content: "试题_#{t+1}_答案_4"}
  ])
end

Exam.create!(user: student, paper: paper)

exam = student.exams.first

paper.questions.each do |q|
  exam.answers.create!(question: q, content: q.options.first.content)
end
