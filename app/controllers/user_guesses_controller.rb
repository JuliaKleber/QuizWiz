class UserGuessesController < ApplicationController
  def create
    user_picks = params[:user_pick]
    quiz = params[:quiz_id]
    # questions = params[:questions]
    user_picks.each do |pick, index|
      user_guess = UserGuess.new
      user_guess.user = current_user
      if pick == questions[index].correct_choice
        user_guess.is_correct = true
      else
        user_guess.is_correct = false
      end
      user_guess.save
    end
    redirect_to results_quiz(quiz)
  end

  # private

  # def user_pick_params
  #   params.require(:user_guess).permit(:userPick)
  # end
end
