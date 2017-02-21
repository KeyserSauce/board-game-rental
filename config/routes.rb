Rails.application.routes.draw do
  root to: 'games#index'

  resources :games, only: [:new, :create, :show, :index]

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
