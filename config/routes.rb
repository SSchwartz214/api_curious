Rails.application.routes.draw do
  root 'home#index'

  get 'auth/:provider/callback',  to: 'sessions#create', as: :github_login
  get 'logout',                   to: 'sessions#destroy'              
end
