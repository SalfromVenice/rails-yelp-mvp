class RestaurantsController < ApplicationController
  before_action :set_rest, only: %i[show]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(rest_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurand was successfully created'
    else
      render :new
    end
  end

  private

  def set_rest
    @restaurant = Restaurant.find(params[:id])
  end

  def rest_params
  params.require(:restaurant).permit(:name, :address, :category)
  end
end
