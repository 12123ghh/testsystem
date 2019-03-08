class Subject < ApplicationRecord
  has_many :papers
  has_many :questions

  validates :name, presence: true, uniqueness: true

  def can_be_edit_or_destroy?
    !(papers.exists? || questions.exists?)
  end
end
