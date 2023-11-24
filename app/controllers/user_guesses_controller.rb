class UserGuessesController < ApplicationController
  def create
    user_picks_string = params[:user_picks]
    user_picks_array = user_picks_string.split(";").map(&:split)
    # quiz = params[:quiz_id]
    # questions = params[:questions]
    user_picks_array.each do |(id, pick)|
      user_guess = UserGuess.new
      user_guess.user = current_user
      user_guess.is_correct = (pick == Question.find(id.to_i).correct_choice)
      user_guess.save
    end
    redirect_to user_guesses_results_path
  end

  def results
    user_guesses = UserGuess.where(user_id: current_user)
    number_questions = user_guesses.length
    @count_correct = 0
    user_guesses.each { |guess| @count_correct += 1 if guess.is_correct }
    @count_wrong = number_questions - @count_correct
    user_guesses.each { |user_guess| user_guess.destroy }
  end
end
