class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = "Welcome back #{user.name}"
      session[:user_id] = user.id
      redirect_to quotes_path
    else
      flash.now[:alert] = "Fuck you"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil if session[:user_id]
    redirect_to root_path
  end
end
