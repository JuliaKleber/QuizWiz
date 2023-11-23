class UserGuessesController < ApplicationController
  def create
    @question.user = current_user
    @quiz_question = QuizQuestion.find(params[:id])
    # when @question.choice_one || @question.choice_two clicked
    # user_guesses = []
    # user_guess = @question.choice
    # user_guesses << user_guess
    # if QuizQuestion.last
    # redirect_to results_quiz_path
  end

end
