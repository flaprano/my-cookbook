Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :recipes, only: [:show, :new, :create, :edit, :update, :index] do
    get 'search', on: :collection
  end
  resources :cuisines, only: [:show, :new, :create, :edit, :update]
  resources :recipe_types, only: [:show, :new, :create]
end
