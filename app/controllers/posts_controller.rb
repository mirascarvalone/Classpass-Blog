class PostsController < ApplicationController
  include SessionsHelper

  def index
    @posts = Post.all.order(updated_at: :desc)
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
      redirect_to @post
    else
      @error = "Your post could not save. Check that the title and content were not blank."
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      @error = "Your post edits could not be saved."
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :studio_id, :rating)
    end
end