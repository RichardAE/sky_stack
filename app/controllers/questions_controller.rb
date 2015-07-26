class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, except: [:index, :new, :create]

  def index
    @questions = Question.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      flash[:success] = 'Your question was submitted successfully'
      redirect_to question_path(@question)
    else
      flash[:danger] = 'There was a problem with your question'
      render 'new'
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
    else
      flash[:danger] = 'There was a problem with your question'
      render 'edit'
    end
  end

  def destroy
    if owner?(object: @question) && @question.destroy
      flash[:success] = 'Your question was deleted successfully'
      redirect_to questions_path
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
