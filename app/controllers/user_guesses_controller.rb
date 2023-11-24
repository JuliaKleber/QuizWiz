class UserGuessesController < ApplicationController
  def create
    user_guess_arrays = params[:user_picks].split(";").map(&:split)
    user_guess_arrays.each do |(quiz_question_id, choice)|
      
      # retrieve corresponding question
      # check if correct
      # populate .is_correct? field
      # connect the current_user & quiz_question
      # save
    end
  end


  private

  def user_pick_params
    params.require(:user_guess).permit(:user_picks)
  end

end
