# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  
  resources :chatrooms do
    resources :messages
  end
  resources :users
  resources :sessions, only: %i[new create destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'home#index'
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
