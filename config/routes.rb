Rails.application.routes.draw do
  resources :dishes, only: [:show]

  post '/dishes/:id/add_ingredient', to: 'dish_ingredients#create'
end
