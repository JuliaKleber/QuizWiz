class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
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
end

#The quiz needs to be stored in the database, when it is created and still empty, so that the quiz_question references can be created
