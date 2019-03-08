class Subject < ApplicationRecord
  has_many :papers
  has_many :questions

  validates :name, presence: true, uniqueness: true
end
