class Option < ApplicationRecord
  belongs_to :question

  validates :content, presence: true, length: {maximum: 150}
end
