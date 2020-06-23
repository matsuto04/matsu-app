Rails.application.routes.draw do
  root "tops#index"
  resources :comments,only: :index
  resources :tweets,only: :index
end
