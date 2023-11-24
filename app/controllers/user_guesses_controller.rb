class UserGuessesController < ApplicationController

  # def create
  #   user_guess_arrays = params[:user_picks].split(";").map(&:split)
  #   user_guess_arrays.each do |(quiz_question_id, choice)|

  #     # retrieve corresponding question
  #     # check if correct
  #     # populate .is_correct? field
  #     # connect the current_user & quiz_question
  #     # save
  #   end
  # end

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
