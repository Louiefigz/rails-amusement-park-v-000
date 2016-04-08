class RidesController < ApplicationController
  def new
    @attraction = Attraction.new
    @attractions = Attraction.all
  end

  def create
    binding.pry
  end
end
