require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    it '#total_calories: counts the total of all the calories of all the ingredients of one dish' do
      @chef = Chef.create!(name: "Mario")
      @dish1  = @chef.dishes.create!(name: "Pizza", description: "Freshly made doe with tomato sauce and cheese sprinkled on top with your choice of pepperoni and sausage to top it off.")
      @ingredient1 = Ingredient.create!(name: "Pepperoni", calories: 10)
      @ingredient2 = Ingredient.create!(name: "Sausage", calories: 20)
      @ingredient3 = Ingredient.create!(name: "Bannana Peppers", calories: 5)
      DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
      DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)

      expect(@dish1.total_calories).to eq(30)
    end
  end
end