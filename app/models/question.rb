class Question < ApplicationRecord
  has_and_belongs_to_many :papers

  belongs_to :subject

  has_many :options, dependent: :destroy
  has_many :answers

  validates :title, presence: true, length: {maximum:100}
  accepts_nested_attributes_for :options, allow_destroy: true

  validate :validate_question_type

  enum level: {"入门": 0, "初级": 1, "中级": 2, "高级": 3}

  #题目类型包括单选题，填空题，判断题，简答题
  enum question_type: {"multiple_choice": 0, "sentence_completion": 1,
     "true_or_flase_question": 2, "short_answer_question": 3}

  def can_be_destroy?
    !(papers.exists?)
  end

  private
  #根据题目类型进行不同验证
  def validate_question_type
    if self.multiple_choice? && options.count < 2
      #单选题最少需要两个选项
      errors.add(:question_type, "单选题最少需要两个选项！")
    elsif self.sentence_completion? && standard_answer.blank?
      #填空题标准答案不能为空
      errors.add(:standard_answer, "标准答案不能为空")
    elsif self.short_answer_question? && standard_answer.blank?
      #简答题标准答案不能为空
      errors.add(:standard_answer, "标准答案不能为空")
    elsif self.true_or_flase_question? && true_answer.nil?
      #判断题必须设置是否正确或者错误
      errors.add(:true_answer, "判断题答案未设置")
    end
  end
end
