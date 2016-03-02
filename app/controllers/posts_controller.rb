class PostsController < ApplicationController
  include SessionsHelper

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(author: current_user))
    if @post.save
      redirect_to post_path(@post)
    else
      @error = "Your post could not save. Check that the title and content were not blank."
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end