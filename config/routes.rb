Rails.application.routes.draw do
  resources :events
  devise_for :users
  resources :attendees
  get '/past-events', to: 'events#expireds'
  root 'events#showcase'
  get '/user-search', to: 'users#index'
  get '/user/:id', to: 'users#profile', as: :user
  resources :users, only: :index
end
