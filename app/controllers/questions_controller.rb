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

  def destroy_old_connection_and_edit_question
    # question will not be edited. Instead the question gets removed from the
    # quiz_question list for the quiz from which the edit was initiated
    # and then a new question will be created for the quiz
    @quiz = Quiz.find(params[:id])
    @question = Question.find(params[:quiz_id])
    quiz_questions = QuizQuestion.where(quiz_id: params[:id])
    quiz_question = quiz_questions.find_by(question_id: params[:quiz_id])
    quiz_question.destroy
  end

  def updated_question
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      @quiz_question = QuizQuestion.new
      @quiz_question.quiz_id = params[:quiz_id]
      @quiz_question.question = @question
      if @quiz_question.save
        redirect_to edit_quiz_path(quiz), notice: "Question was changed!"
      else
        render :edit, status: :unprocessable_entity
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :choice_one, :choice_two, :correct_choice)
  end
end
