Rails.application.routes.draw do
  root to: 'home#index'
  resources :recipes, only: [:show, :new, :create, :edit, :update, :index] do
    get 'search', on: :collection
  end
  resources :cuisines, only: [:show, :new, :create, :edit, :update]
  resources :recipe_types, only: [:show, :new, :create]
end
