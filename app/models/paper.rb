class Paper < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :exams

  enum review: {check:0,spass:1,fpass:2}
end
