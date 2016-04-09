class AttractionsController < ApplicationController
  def index
    @current_user = current_user
    @attractions = Attraction.all
  end

  def show
    @user = current_user
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
    @attractions = Attraction.all
  end

  def create

    @user = User.find(session[:user_id])
    @attraction = Attraction.new(att_params)

    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(att_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def att_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
