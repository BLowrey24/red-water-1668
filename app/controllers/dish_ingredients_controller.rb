class DishIngredientsController < ApplicationController
  def create
    @dish = Dish.find(params[:id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    
    if @dish.ingredients.include?(@ingredient)
      flash[:error] = "This dish already contains that ingredient."
    else
      @dish.ingredients << @ingredient
      flash[:success] = "Ingredient added to dish."
    end

    redirect_to @dish
  end
end