class Answer < ApplicationRecord
  belongs_to :exam
  belongs_to :question

  # 允许用户不答题，不答题的情况下没有option
  belongs_to :option, optional: true

  # 保存之后自动计算是否为正确答案
  after_save :check_is_right_answer

  scope :right_answer, -> { where(is_right_answer: true) }

  #题目类型包括单选题，填空题，判断题，简答题
  enum question_type: {"multiple_choice": 0, "sentence_completion": 1,
     "true_or_flase_question": 2, "short_answer_question": 3}

  private
  def check_is_right_answer
    # 当选择了答案之后，判断是否为正确答案并保存。
    case question_type
    when "multiple_choice"
      check_multiple_choice_answer
    when "sentence_completion"
      check_sentence_completion_answer
    when "true_or_flase_question"
      check_true_or_flase_question_answer
    end
  end

  def check_multiple_choice_answer
    # 选择题2分
    update_columns(is_right_answer: true, score: 2) if option.present? && option.is_right_answer
  end

  def check_sentence_completion_answer
    # 填空题1分
    update_columns(is_right_answer: true, score: 1) if content == question.standard_answer
  end

  def check_true_or_flase_question_answer
    # 判断题1分
    update_columns(is_right_answer: true, score: 1) if true_answer == question.true_answer
  end
end
