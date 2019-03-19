class Question < ApplicationRecord
  has_and_belongs_to_many :papers

  belongs_to :subject

  has_many :options, dependent: :destroy
  has_many :answers

  validates :title, presence: true, length: {maximum:100}
  accepts_nested_attributes_for :options, allow_destroy: true

  validate :validate_question_type

  enum level: {"入门": 0, "初级": 1, "中级": 2, "高级": 3}
  enum question_type: {"单选题": 0, "填空题": 1, "判断题": 2, "简答题": 3}

  def can_be_destroy?
    !(papers.exists?)
  end

  private
  def validate_question_type
    if question_type == 0 && options.count < 2
      errors.add(:question_type, "单选题最少需要两个选项！")
    elsif (question_type == 1 || 3) && (standard_answer == nil || "")
      errors.add(:standard_answer, "填空题，简答题标准答案不能为空")
    elsif question_type == 2 && true_answer == nil
      errors.add(:true_answer, "判断题答案未设置")
    end
  end
end
