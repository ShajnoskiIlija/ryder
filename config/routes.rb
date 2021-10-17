# frozen_string_literal: true

Rails.application.routes.draw do

  get '/rent_items', to: 'rent_items#index', as: 'rent_items'
  get '/rent_items/:id', to: 'rent_items#show', as: 'rent_item'
  devise_for :users
  get "/home", to: "pages#home"
  get "/about", to: "pages#about"
  post "/create_contact", to: 'pages#create_contact'

  root to: "pages#home"
end
