class ReviewsController < ApplicationController
  before_action :find_rest

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(rev_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def find_rest
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def rev_params
    params.require(:review).permit(:rating, :content)
  end
end
