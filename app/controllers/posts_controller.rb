class PostsController < ApplicationController
  include SessionsHelper

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

end