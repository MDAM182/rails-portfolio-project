Rails.application.routes.draw do
  root 'welcome#index'


  resources :workouts


  get 'signup', to: 'users#new'
  resources :users, except: [:new]

end
