Rails.application.routes.draw do
  get 'results/show'

  root to: 'games#index'

  resources :games, only: [:new, :create, :show, :index]
  resources :profilers, only: [:show]
  resources :settings, only: [:show]
  resources :results, only: [:index]

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
