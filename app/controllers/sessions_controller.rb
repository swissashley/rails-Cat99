class SessionsController < ApplicationController

  # before_action :logged_in?

  def new
    render :new
  end

  def create

    # fail
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    unless @user
      flash[:errors] = "User/password not found"
      redirect_to new_session_url
    else
      session[:session_token] = @user.session_token
      redirect_to cats_url
    end
  end

  def destroy
    @user = current_user
    if @user
      @user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to new_session_url
  end

  # def logged_in?
  #   if @user.nil?
  #     redirect_to new_session_url
  #   else
  #     redirect_to cats_url
  #   end
  # end

end
