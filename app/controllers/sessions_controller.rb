class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to posts_path
  end
end