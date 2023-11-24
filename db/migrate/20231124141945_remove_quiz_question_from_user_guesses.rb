class RemoveQuizQuestionFromUserGuesses < ActiveRecord::Migration[7.1]
  def change
    remove_reference :user_guesses, :quiz_question, null: false, foreign_key: true
  end
end
