class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  def new
    redirect_to home_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.active?
        session[:user_id] = user.id
        redirect_to home_path, notice: "You are signed in, enjoy!"
      else
        flash[:error] = "Your account has been suspended, please contact customer service."
        redirect_to sign_in_path
      end
    else
      flash[:error] = "Invalid email or password."
      redirect_to sign_in_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are signed out."
  end
end