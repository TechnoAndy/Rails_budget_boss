# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :users, only: %i[index show new] do
    resources :groups, only: %i[new create show index destroy]
    resources :chronicles, only: %i[new create index show destroy]
  end
  # Defines the root path route ("/")
  get 'logout', to: 'session#destroy', as: 'logout'
  # root "articles#index"
end
