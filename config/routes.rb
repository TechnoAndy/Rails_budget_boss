Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :users, only: [:index, :show, :new] do
    resources :groups, only: [:new, :create, :show, :index, :destroy]
    resources :entities, only: [:new, :create, :index, :show, :destroy]
  end
  # Defines the root path route ("/")
  get 'logout', to: 'session#destroy', as: 'logout'
  # root "articles#index"
end
