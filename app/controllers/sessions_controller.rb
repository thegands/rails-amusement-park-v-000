class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find(params[:user][:id])
    session[:user_id] = user.id
    redirect_to user
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
