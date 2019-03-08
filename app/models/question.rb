class Question < ApplicationRecord
  belongs_to :paper
  belongs_to :subject

  has_many :options, dependent: :destroy
  has_many :answers

  validates :title, presence: true, length: {maximum:100}
  accepts_nested_attributes_for :options, allow_destroy: true
end
