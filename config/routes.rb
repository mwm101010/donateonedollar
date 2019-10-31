Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "campaigns#index"
  resources :campaigns
  resources :contacts, only: [:new, :create]
  resources :donates, only: [:new, :create]
  resources :pages, only: :index
  resources :galleries, only: :index
end
