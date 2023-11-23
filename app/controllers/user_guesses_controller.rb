class UserGuessesController < ApplicationController
  def create
    user_guesses = params[:user_pick]

    # @question.user = current_user
    # @quiz_question = QuizQuestion.find(params[:id])
    # @answer = params[:answer]
    # if @answer == Question.find(id: quiz_question_id).
    @user_guess = UserGuess.new(user_pick_params)




    # when @question.choice_one || @question.choice_two clicked
    # user_guesses = []
    # user_guess = @question.choice
    # user_guesses << user_guess



  end

  def results
    # if QuizQuestion.last
    # redirect_to results_quiz_path
    # show ${results}
  end

  private

  def user_pick_params
    params.require(:user_guess).permit(:userPick)
  end

end


# create_table "user_guesses", force: :cascade do |t|
#   t.bigint "user_id", null: false
#   t.bigint "quiz_question_id", null: false
#   t.boolean "is_correct"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["quiz_question_id"], name: "index_user_guesses_on_quiz_question_id"
#   t.index ["user_id"], name: "index_user_guesses_on_user_id"
# end
