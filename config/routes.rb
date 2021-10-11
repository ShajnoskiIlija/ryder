# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  get "/home", to: "pages#home"
  get "/about", to: "pages#about"
  post "/create_contact", to: 'pages#create_contact'

  root to: "pages#home"
end
