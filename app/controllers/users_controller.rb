class UsersController < ApplicationController
  def new
    if logged_in?
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else

      render :new
    end
  end

  def edit

  end

  def update
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  def show
    @user = User.find(params[:id])
  end

  def reduce_tickets

    redirect_to user_path(current_user)
  end


private

  def user_params
    params.require(:user).permit(:name, :tickets, :nausea, :happiness, :height, :admin)
  end

end
