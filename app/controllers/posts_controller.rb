class PostsController < ApplicationController
  before_action :retrieve_post, only: [:show, :edit, :update, :destroy]

  def retrieve_post
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.create
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = 'Your post has been created.'
      redirect_to @post
    else
      flash[:alert] = 'Halt, you fiend! You need an image to post here!'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated, hombre'
      redirect_to @post
    else
      flash[:alert] = 'Something is wrong with your form!'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Problem solved! Post deleted.'
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
