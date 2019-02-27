class Exam < ApplicationRecord
  belongs_to :paper
  belongs_to :user, -> { student }

  has_many :answers

  enum state: {pending: 1, finished: 2, close: 3}
end
