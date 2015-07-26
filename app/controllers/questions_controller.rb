class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, except: [:new, :create]

  def new
    @question = Question.new
  end

  def create
    question = current_user.questions.new(question_params)

    if question.save
      flash[:success] = 'Your question was submitted successfully'
      redirect_to question_path(question)
    end
  end

  def show
    @answer   = Answer.new
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:success] = 'Your question was modified successfully'
      redirect_to question_path(@question)
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :text)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
