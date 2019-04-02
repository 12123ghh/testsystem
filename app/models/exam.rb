class Exam < ApplicationRecord
  belongs_to :paper
  belongs_to :user, -> { student }

  has_many :answers, -> { order(question_type: :asc) }
  accepts_nested_attributes_for :answers

  enum state: {pending: 1, finished: 2, close: 3}

  # 计算分数
  def calculate_score
    # 正确答案/所有答案=正确率
    # 0 if 
    return 0 if answers.blank?

    (answers.right_answer.count.to_f / answers.count.to_f * 100).round(2)
  end
end
