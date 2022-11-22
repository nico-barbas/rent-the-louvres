Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :artworks, only: [:index, :show] do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:index, :edit, :update, :destroy]
end
