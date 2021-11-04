# frozen_string_literal: true

Rails.application.routes.draw do

  resources :rent_items, only: %i[index show]
  devise_for :users
  get "/home", to: "pages#home"
  get "/about", to: "pages#about"
  post "/create_contact", to: 'pages#create_contact'
  root to: "pages#home"

  resources :rent_items, only: %i[index show create edit update destroy]
  namespace :dashboard do
    resources :rent_items
    root to: 'dashboard#home'
  end
end
