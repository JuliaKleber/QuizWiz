class Question < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :choice_one, presence: true
  validates :choice_two, presence: true
end
