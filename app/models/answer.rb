class Answer < ApplicationRecord
  belongs_to :exam
  belongs_to :question

  # 允许用户不答题，不答题的情况下没有option
  belongs_to :option, optional: true
end
