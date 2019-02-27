class Paper < ApplicationRecord
  belongs_to :creater, optional: true
  has_many :questions
  has_many :options ,through: :questions
  accepts_nested_attributes_for :questions
  accepts_nested_attributes_for :options

  enum review:{check:0,spass:1,fpass:2}
end
