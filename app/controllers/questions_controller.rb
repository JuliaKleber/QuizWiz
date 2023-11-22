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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.new(question_params)
    @question.user = current_user
    @question.id = params[:id]
    @question.update
  end

  private

  def question_params
    params.require(:question).permit(:content, :choice_one, :choice_two)
  end
end
