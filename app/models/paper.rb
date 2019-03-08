class Paper < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :subject

  has_and_belongs_to_many :questions
  has_many :exams

  validates :title, presence: true, length: {maximum: 100}

  accepts_nested_attributes_for :questions, allow_destroy: true

  delegate :name, to: :subject, prefix: true
  delegate :name, to: :creator, prefix: true

  enum review: {check: 0, spass: 1, fpass: 2 }
  enum level: {"入门": 0, "初级": 1, "中级": 2, "高级": 3}

  def generate_questions
    question_ids = subject.questions.public_send(level).ids.sample(question_number).uniq
    questions << Question.find(question_ids)
  end
end
