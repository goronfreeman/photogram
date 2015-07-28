class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comments_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = 'You commented the hell out of that post!'
      redirect_to :back
    else
      flash[:alert] = 'Check the comment form, something went horribly wrong.'
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if current_user.id == @comment.user_id
      @comment.destroy
      flash[:success] = 'Comment deleted :('
      redirect_to root_path
    else
      flash[:alert] = "That doesn't belong to you!"
      redirect_to :back
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
