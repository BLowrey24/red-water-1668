require 'rails_helper'

RSpec.describe '/dishes/:id', type: :feature do
  before(:each) do
    @chef = Chef.create!(name: "Mario")
    @dish1  = @chef.dishes.create!(name: "Pizza", description: "Freshly made doe with tomato sauce and cheese sprinkled on top with your choice of pepperoni and sausage to top it off.")
    @ingredient1 = Ingredient.create!(name: "Pepperoni", calories: 10)
    @ingredient2 = Ingredient.create!(name: "Sausage", calories: 20)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    visit "/dishes/#{@dish1.id}"
  end
  describe "when I visit a dish's show page" do
    it "I see the dish’s name, description, a list of ingredients for that dish, a total calorie count for that dish, and the chef's name" do
      save_and_open_page
      expect(page).to have_content("#{@dish1.name}")
      expect(page).to have_content("#{@dish1.description}")
      expect(page).to have_content("#{@ingredient1.name}")
      expect(page).to have_content("#{@ingredient2.name}")
      expect(page).to have_content("#{@dish1.total_calories}")
      expect(page).to have_content("#{@chef.name}")
    end
  end
end