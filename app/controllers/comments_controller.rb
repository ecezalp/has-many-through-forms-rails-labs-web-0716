class CommentsController < ApplicationController

  def create
    # byebug
    if params[:comment][:user][:username] != ""
      real_user = User.create(username: params[:comment][:user][:username])
      @comment = Comment.create(user_id: real_user.id, content: params[:comment][:content], post_id: params[:comment][:post_id])
    else 
      @comment = Comment.create(comment_params)
    end
    redirect_to post_path(@comment.post_id)
  end

  def show
    redirect_to post_path(params[:id].post)
  end

  


  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
