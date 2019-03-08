class Question < ApplicationRecord
  has_and_belongs_to_many :papers

  belongs_to :subject

  has_many :options, dependent: :destroy
  has_many :answers

  validates :title, presence: true, length: {maximum:100}
  accepts_nested_attributes_for :options, allow_destroy: true

  enum level: {"入门": 0, "初级": 1, "中级": 2, "高级": 3}

  def can_be_destroy?
    !(papers.exists?)
  end
end
