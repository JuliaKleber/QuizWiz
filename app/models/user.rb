class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :quizzes
  has_many :user_guesses
  # has_one_attached :photo

  validates :user_name, presence: true, uniqueness: true,length: { minimum: 4, maximum: 20 }
end
