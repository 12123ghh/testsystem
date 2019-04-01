class Paper < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :subject

  has_and_belongs_to_many :questions
  has_many :exams

  validates :title, presence: true, length: {maximum: 100}
  validates_numericality_of :multiple_choice_count, greater_than_or_equal_to: 5
  validates_numericality_of :sentence_completion_count, greater_than_or_equal_to: 5
  validates_numericality_of :true_or_flase_question_count, greater_than_or_equal_to: 5
  validates_numericality_of :short_answer_question_count, greater_than_or_equal_to: 1

  validate :validate_question_number, on: :update

  accepts_nested_attributes_for :questions, allow_destroy: true

  delegate :name, to: :subject, prefix: true
  delegate :name, to: :creator, prefix: true

  enum review: {check: 0, spass: 1, fpass: 2 }
  enum level: {"入门": 0, "初级": 1, "中级": 2, "高级": 3}

  after_create :generate_questions

  def generate_questions
    generate_multiple_choice_questions
    generate_sentence_completion_questions
    generate_true_or_flase_question_questions
    generate_short_answer_question_questions
  end

  private
  def validate_question_number
    errors.add(:multiple_choice_count, "题库中选择题数量不足或未选择足够数量") if questions.exists? && (questions.multiple_choice.size < multiple_choice_count)
    errors.add(:sentence_completion_count, "题库中填空题题数量不足或未选择足够数量") if questions.exists? && (questions.sentence_completion.size < sentence_completion_count)
    errors.add(:true_or_flase_question_count, "题库中判断题题数量不足或未选择足够数量") if questions.exists? && (questions.true_or_flase_question.size < true_or_flase_question_count)
    errors.add(:short_answer_question_count, "题库中简单题题数量不足或未选择足够数量") if questions.exists? && (questions.short_answer_question.size < short_answer_question_count)
  end

  def generate_multiple_choice_questions
    question_ids = subject.questions.multiple_choice.public_send(level).ids.uniq.sample(multiple_choice_count)
    questions << Question.find(question_ids)
  end

  def generate_sentence_completion_questions
    question_ids = subject.questions.sentence_completion.public_send(level).ids.uniq.sample(sentence_completion_count)
    questions << Question.find(question_ids)
  end

  def generate_true_or_flase_question_questions
    question_ids = subject.questions.true_or_flase_question.public_send(level).ids.uniq.sample(true_or_flase_question_count)
    questions << Question.find(question_ids)
  end

  def generate_short_answer_question_questions
    question_ids = subject.questions.short_answer_question.public_send(level).ids.uniq.sample(short_answer_question_count)
    questions << Question.find(question_ids)
  end
end
