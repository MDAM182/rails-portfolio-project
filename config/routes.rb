Rails.application.routes.draw do
  root 'user#index'

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
