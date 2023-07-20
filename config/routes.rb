Rails.application.routes.draw do
  devise_for :users
  resources :recipe_foods
  resources :inventory_foods
  resources :foods
  resources :recipes
  resources :inventories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :shopping_list, only: [:index]

  # Defines the root path route ("/")
  # root "articles#index"
end
