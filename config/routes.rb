Rails.application.routes.draw do
  # get 'games/index'

  # get 'games/show'

  resources :games, only: [:new, :create, :show, :index]

  devise_for :users
  root to: 'pages#home'
end
