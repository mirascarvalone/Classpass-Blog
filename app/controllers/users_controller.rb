class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in(user)
      redirect_to posts_path
    else
      @error = 'There was an error creating your account.'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(author: @user)
    @post = Post.new
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end