class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question
  before_action :find_answer, except: :create

  def create
    answer = @question.answers.new(answer_params)

    if answer.save
      flash[:success] = 'Your answer was submitted successfully'
      redirect_to question_path(@question)
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      flash[:success] = 'Your answer was modified successfully'
      redirect_to question_path(@answer.question)
    end
  end

  def destroy
    if @answer.destroy
      flash[:success] = 'Your answer was deleted successfully'
      redirect_to question_path(@question)
    end
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
