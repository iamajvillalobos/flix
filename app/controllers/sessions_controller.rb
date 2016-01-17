class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:username_email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}"
      redirect_to user_path(user)
    else
      flash.now[:alert] = "Invalid credentials combination"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now signed out!"
    redirect_to root_path
  end
end
