class UserGuess < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_question

  validates :is_correct, presence: true
end
