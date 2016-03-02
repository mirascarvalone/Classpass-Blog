class PostsController < ApplicationController
  include SessionsHelper

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

end