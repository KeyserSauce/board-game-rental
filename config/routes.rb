Rails.application.routes.draw do
  get 'results/show'

  root to: 'games#home'

  mount Attachinary::Engine => "/attachinary"

  resources :games, only: [:new, :create, :show, :index]
    resources :rentals, only: [:new, :create, :show]

  resources :profilers, only: [:show]
    resources :rentals, only: [:update]

  resources :settings, only: [:show]
  resources :results, only: [:index]

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
