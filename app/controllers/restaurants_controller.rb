class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end
  def show
  end
  def new
    @restaurant = Restaurant.new # needed to instantiate the form_for
  end
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save     # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to restaurant_path(@restaurant)
  end
  def edit
  end
  def update
    @restaurant.update(restaurant_params)
    # no need for app/views/restaurants/update.html.erb
    redirect_to restaurant_path(@restaurant)
  end
    def destroy
    @restaurant.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path
  end
  private 
  def restaurant_params
    params.require(:restaurant).permit(:name, :rating, :address)
  end
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])   
  end
end
