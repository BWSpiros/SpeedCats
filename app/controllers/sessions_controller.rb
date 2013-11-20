class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      session[:token] = @user.reset_token
      # fail
      redirect_to cats_url
    else
      flash.now[:errors] = "Username or Password were incorrect."
      render :new
    end
  end

  def destroy
    session[:token] = nil
    current_user.reset_token if logged_in?
    redirect_to new_session_url
    # fail
  end


end
