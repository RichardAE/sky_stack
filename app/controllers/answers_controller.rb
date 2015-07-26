class AnswersController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    answer   = question.answers.new(answer_params)

    if answer.save
      flash[:success] = 'Your answer was submitted successfully'
      redirect_to question_path(question)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id)
  end
end
