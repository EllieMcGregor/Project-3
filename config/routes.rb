Rails.application.routes.draw do
  devise_for :users
  
  resources :favourites

  resources :recipes

  resources :quantities

  resources :nutritions

  resources :ingredients

  resources :food_items

  resources :recipes do
    get 'page/:page', action: :index, on: :collection
  end


  
  root to: "home#index"
end
