Rails.application.routes.draw do
  get 'games/index'

  get 'games/show'

  devise_for :users
  root to: 'pages#home'
end
