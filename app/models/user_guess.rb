class UserGuess < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_question
end
