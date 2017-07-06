Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  get '/my_recipes', to: 'recipes#my_recipes'
  get '/favorited_recipes', to: 'recipes#favorited_recipes'
  resources :recipes, only: [:show, :new, :create, :edit, :update, :index] do
      get 'search', on: :collection
      post 'favorite', on: :member
  end
  resources :cuisines, only: [:show, :new, :create, :edit, :update]
  resources :recipe_types, only: [:show, :new, :create]
end
