Rails.application.routes.draw do
  # get 'games/index'

  # get 'games/show'

  resources :games, only: [:new, :create, :show, :index]
  resources :profilers, only: [:show]

  devise_for :users
  root to: 'games#index'
end
