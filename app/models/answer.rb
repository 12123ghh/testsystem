class Answer < ApplicationRecord
  belongs_to :exam
  belongs_to :question
  belongs_to :option
end
