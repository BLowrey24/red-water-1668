class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @dish_ingredients = @dish.ingredients
  end
end