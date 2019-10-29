Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "campaigns#index"
  resources :campaigns, only: [:new, :create, :show]
  resources :contacts, only: [:new, :create]
  resources :donates, only: [:new, :create]
  resources :pages, only: :index
  resources :galleries, only: :index
end
