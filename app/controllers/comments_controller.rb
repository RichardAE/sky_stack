class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :respond_to_ajax

  def create
    @commentable = find_commentable
    @comment     = @commentable.comments.create(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if owner?(object: @comment)
  end

  private

  def find_commentable
    params.to_a.reverse.to_h.each do |name, value|
      if name =~ /_id$/
        return name.split('_')[0].capitalize.constantize.find(value)
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end

  def respond_to_ajax
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js   {}
    end
  end
end
