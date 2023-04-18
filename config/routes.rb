Rails.application.routes.draw do
  resources :dishes, only: [:show]

  resources :chefs, only: [:show]
  
  resources :chef do
    resources :ingredients, only: [:index]
  end
  
  
  post '/dishes/:id/add_ingredient', to: 'dish_ingredients#create'
end
