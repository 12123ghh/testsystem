class Answer < ApplicationRecord
  belongs_to :exam
  belongs_to :question

  # 允许用户不答题，不答题的情况下没有option
  belongs_to :option, optional: true

  # 保存之后自动计算是否为正确答案
  after_save :check_is_right_answer

  scope :right_answer, -> { where(is_right_answer: true) }

  private
  def check_is_right_answer
    # 当选择了答案之后，判断是否为正确答案并保存。
    update_column(:is_right_answer, option.is_right_answer) if option.present?
  end
end
