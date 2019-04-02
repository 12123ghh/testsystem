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

Subject.create!(name: "语文")
Subject.create!(name: "数学")
Subject.create!(name: "英语")

Subject.all.each do |s|
  Question.levels.keys.each do |level|
    Question.question_types.keys.each do |q_t|
      20.times do |t|
        question = Question.new(
          subject: s,
          title: "【#{s.name}】#{level}_考试试题_#{t+1}",
          level: level,
          question_type: q_t,
          standard_answer: "standard_answer",
          true_answer: true)

        question.options.build([
          {content: "答案_1", is_right_answer: true},
          {content: "答案_2"},
          {content: "答案_3"},
          {content: "答案_4"}
        ]) if question.multiple_choice?

        question.save!
      end
    end
  end
end

Subject.all.each do |s|
  Paper.levels.keys.each do |level|
    paper = Paper.create!(
      subject: s,
      level: level,
      question_number: 20,
      total_points: 100,
      review: "spass",
      creator: teacher,
      title: "【#{s.name}】#{level}_考试试卷",
      multiple_choice_count: 5,
      sentence_completion_count: 5,
      true_or_flase_question_count: 5,
      short_answer_question_count: 2)
  end
end

Exam.create!(user: student, paper: Paper.first)

exam = student.exams.first
Paper.first.questions.each do |q|
  case q.question_type
  when "multiple_choice"
    exam.answers.create!(question: q, option: q.options.first)
  when "sentence_completion"
    exam.answers.create!(question: q, content: q.standard_answer)
  when "true_or_flase_question"
    exam.answers.create!(question: q, true_answer: q.true_answer)
  when "short_answer_question"
    exam.answers.create!(question: q, content: q.standard_answer)
  end
end
