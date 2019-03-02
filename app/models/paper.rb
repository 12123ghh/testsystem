class Paper < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :exams

  accepts_nested_attributes_for :questions, allow_destroy: true

  enum review: {check:0,spass:1,fpass:2}
end
