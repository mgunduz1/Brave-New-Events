Rails.application.routes.draw do
  resources :events
  devise_for :users
  resources :attendees

  root 'events#index'
  get '/showcase', to: 'events#showcase'
  get '/user/:id', to: 'users#profile', as: :user
  resources :users, only: :index
end
