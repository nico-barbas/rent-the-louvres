Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :artworks, only: [:index, :show] do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:edit, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
