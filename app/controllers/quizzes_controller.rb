class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    quiz_questions = QuizQuestion.where(quiz_id: @quiz.id)
    @questions = []
    quiz_questions.each do |quiz_question|
      question = Question.find(quiz_question.question_id)
      @questions << question
    end
    @user_name = @quiz.user.user_name
    @user = @quiz.user
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    if @quiz.save
      redirect_to questions_new_path(@quiz), notice: 'Quiz was successfully created. Now please add your questions.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
    @quiz_questions = QuizQuestion.where(quiz_id: @quiz.id)
    @questions = []
    @quiz_questions.each do |quiz_question|
      question = Question.find(quiz_question.question_id)
      @questions << question
    end
  end

  def update
    @quiz = Quiz.find(params[:id])
    @quiz.name = params[:name]
    if @quiz.update
      redirect_to questions_new_path(@quiz), notice: 'Quiz was successfully created. Now please add your questions.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz_questions = QuizQuestion.where(quiz_id: @quiz.id)
    @quiz_questions.each { |quiz_question| quiz_question.destroy }
    @message = ""
    @quiz.destroy
    redirect_to quizzes_path
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
