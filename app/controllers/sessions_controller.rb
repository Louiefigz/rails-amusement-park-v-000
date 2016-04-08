class SessionsController < ApplicationController
  def new
    @user = User.new
   @users = User.all
  end

  def create
    @user = User.find(params[:user][:id].to_i)
      session[:user_id] = params[:user][:id]
      redirect_to user_path(@user)
  end
end
