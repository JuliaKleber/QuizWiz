class User < ApplicationRecord
  has_many :questions
  has_many :quizzes
  has_many :user_guesses

  validates :user_name, presence: true, uniqueness: true,length: { minimum: 4, maximum: 20 }
end
