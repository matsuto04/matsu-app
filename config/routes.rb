Rails.application.routes.draw do
  devise_for :users
  root "tops#index"
  resources :users, only: [:edit, :update]
  resources :tweets,only: :index
  resources :groups,only: [:new, :create,:edit,:update,:index] do
    resources :comments,only: [:index,:create]
  end
end
