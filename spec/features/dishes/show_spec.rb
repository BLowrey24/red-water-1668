require 'rails_helper'

RSpec.describe '/dishes/:id', type: :feature do
  before(:each) do
    @chef = Chef.create!(name: "Mario")
    @dish1  = @chef.dishes.create!(name: "Pizza", description: "Freshly made doe with tomato sauce and cheese sprinkled on top with your choice of pepperoni and sausage to top it off.")
    @ingredient1 = Ingredient.create!(name: "Pepperoni", calories: 10)
    @ingredient2 = Ingredient.create!(name: "Sausage", calories: 20)
    @ingredient3 = Ingredient.create!(name: "Bannana Peppers", calories: 5)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    visit "/dishes/#{@dish1.id}"
  end
  describe "when I visit a dish's show page" do
    it "I see the dish’s name, description, a list of ingredients for that dish, a total calorie count for that dish, and the chef's name" do
      expect(page).to have_content("#{@dish1.name}")
      expect(page).to have_content("#{@dish1.description}")
      expect(page).to have_content("#{@ingredient1.name}")
      expect(page).to have_content("#{@ingredient2.name}")
      expect(page).to have_content("#{@dish1.total_calories}")
      expect(page).to have_content("#{@chef.name}")
    end
    
    it "I see a form to add an existing Ingredient to that Dish When I fill in the form with the ID of an Ingredient that exists in the database And I click Submit Then I am redirected to that dish's show page And I see that ingredient is now listed. " do
      select @ingredient3.name, from: "ingredient_id"
      click_button "Add Ingredient"
      
      expect(page).to have_content(@ingredient3.name)
      expect(page).to have_content("Calories: 35") # Is there a better way to test this instead of just hard coding this?
    end
  end
end