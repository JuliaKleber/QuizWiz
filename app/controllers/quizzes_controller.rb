class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
    @authors = @quizzes.map { |quiz| quiz.user }
  end

  def my_own
    @quizzes = Quiz.where(user_id: current_user)
  end

  def show
    play
    @user_name = @quiz.user.user_name
    @user = @quiz.user
  end

  def play
    @quiz = Quiz.find(params[:id])
    @quiz_questions = QuizQuestion.includes(:question).where(quiz_id: params[:id])
    @questions = @quiz_questions.map(&:question)
    @user_guess = UserGuess.new
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    if @quiz.save
      redirect_to new_quiz_question_path(@quiz), notice: 'Quiz was successfully created. Now please add your questions.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
    redirect_to root_path if current_user != @quiz.user
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
      redirect_to new_quiz_question_path(@quiz), notice: 'Quiz was successfully created. Now please add your questions.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz_questions = QuizQuestion.where(quiz_id: @quiz.id)
    @quiz_questions.each { |quiz_question| quiz_question.destroy }
    @quiz.destroy
    redirect_to my_own_quizzes_path, status: :see_other
  end

  def results
    user_guesses = UserGuess.where(user_id: current_user)
    number_questions = user_guessses.length
    @count_correct = 0
    user_guesses.each { |guess| @count_correct += 1 if guess.is_correct }
    @count_wrong = number_questions - @count_correct
    user_guesses.each { |user_guess| user_guess.destroy }
  end


  private

  def quiz_params
    params.require(:quiz).permit(:name)
  end
end
