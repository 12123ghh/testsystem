class Exam < ApplicationRecord
  belongs_to :paper
  belongs_to :user, -> { student }

  has_many :answers, -> { order(question_type: :asc) }
  accepts_nested_attributes_for :answers

  enum state: {pending: 1, finished: 2, close: 3}

  # 计算分数
  def calculate_score
    # 当选择了答案之后，判断是否为正确答案并保存。
    answers.pluck(:score).sum
  end
end
