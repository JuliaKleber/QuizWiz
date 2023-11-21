class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @user = User.find(params[:user_id])
    @question.user = @user
    if @question.save
      @quiz_question = QuizQuestion.new
      @quiz = Quiz.find(params[user:id])
      @quiz_question.quiz = @quiz
      @quiz_question.question = @question
      redirect_to new_quiz_path(@quiz)
    else
      render :new_quiz_path(@quiz), status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :choice_one, :choice_two)
  end
end
