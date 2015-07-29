class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question
  before_action :find_answer, except: :create

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question, flash: { success: 'Your answer was submitted successfully' }
    else
      flash.now[:danger] = 'There was a problem with your answer'
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to @question, flash: { success: 'Your answer was modified successfully' }
    else
      flash.now[:danger] = 'There was a problem with your answer'
      render :edit
    end
  end

  def destroy
    redirect_to @question, flash: { success: 'Your answer was deleted successfully' } if owner?(object: @answer) && @answer.destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
