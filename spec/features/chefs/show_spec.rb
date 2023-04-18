require 'rails_helper'

RSpec.describe '/chefs/:id', type: :feature do
  before(:each) do
    @chef1 = Chef.create!(name: "Mario")
    @chef2 = Chef.create!(name: "Luigi")
    @dish1  = @chef1.dishes.create!(name: "Pizza", description: "Freshly made doe with tomato sauce and cheese sprinkled on top with your choice of pepperoni and sausage to top it off.")
    @ingredient1 = Ingredient.create!(name: "Pepperoni", calories: 10)
    @ingredient2 = Ingredient.create!(name: "Sausage", calories: 20)
    @ingredient3 = Ingredient.create!(name: "Bannana Peppers", calories: 5)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    visit "/chefs/#{@chef1.id}"
  end

  describe "When I visit a chef's show page" do
    it 'I see a link to view a list of all ingredients that this chef uses in their dishes.' do
      expect(page).to have_content("#{@chef1.name}")
      expect(page).to have_link("Chef's Secret Ingredients")
      click_link("Chef's Secret Ingredients")
      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
    end
  end
end