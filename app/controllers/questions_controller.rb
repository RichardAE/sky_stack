class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      flash[:success] = 'Your question was submitted successfully'
      redirect_to question_path(@question.id)
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:title, :text)
  end
end
