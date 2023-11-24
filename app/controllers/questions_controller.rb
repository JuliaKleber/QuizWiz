class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @quiz = Quiz.find(params[:quiz_id])
    redirect_to root_path if current_user != @quiz.user
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      @quiz_question = QuizQuestion.new
      @quiz_question.quiz_id = params[:quiz_id]
      @quiz_question.question = @question
      if @quiz_question.save
        redirect_to new_quiz_question_path(@quiz_question.quiz), notice: "Question was added!"
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def rewrite
    # The question will not be edited. Instead the question gets removed from the
    # quiz_question list of the quiz from which the edit was initiated
    # and then a new question will be created for that quiz
    new
    @old_question = Question.find(params[:id])
    quiz_question = QuizQuestion.where(quiz_id: params[:quiz_id]).where(question_id: params[:id]).first
    quiz_question.destroy
  end

  def exchange
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      @quiz_question = QuizQuestion.new
      @quiz_question.quiz_id = params[:quiz_id]
      @quiz_question.question = @question
      if @quiz_question.save
        redirect_to edit_quiz_path(params[:quiz_id]), notice: "Question was changed!"
      else
        render :rewrite_question, status: :unprocessable_entity
      end
    else
      render :rewrite_question, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :choice_one, :choice_two, :correct_choice)
  end
end
