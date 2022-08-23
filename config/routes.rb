Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events
  put '/events/:id/attend', to: 'events#attend', as: 'attend'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'events#index'
end
