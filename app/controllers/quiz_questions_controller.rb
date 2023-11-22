class QuizQuestionsController < ApplicationController
  def destroy
    @quiz_question = QuizQuestion.find(params[:id])
    @quiz = Quiz.find_by(id: @quiz_question.quiz_id)
    @quiz_question.destroy
    redirect_to edit_quiz_path(@quiz)
  end
end
