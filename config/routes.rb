Rails.application.routes.draw do
  get 'home/index'
  # config/routes.rb
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  root to: 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  

  # Defines the root path route ("/")
  # root "posts#index"
end
