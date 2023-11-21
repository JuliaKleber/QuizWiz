class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
    raise
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to quiz_path(@quiz), notice: 'Quiz was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @quiz = Quiz.new(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    @quiz.update
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
  end

  def results
  end

  def mine
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name)
  end
end

#The quiz needs to be stored in the database, when it is created and still empty, so that the quiz_question references can be created
