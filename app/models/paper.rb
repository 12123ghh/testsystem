class Paper < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :exams

  validates :title, presence: true, length: {maximum: 100}
  validates :subject, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true

  enum review: {check: 0, spass: 1, fpass: 2 }
  enum level: {入门: 0, 初级: 1, 中级: 2, 高级: 3 }
end
