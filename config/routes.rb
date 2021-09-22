# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  get "/home", to: "pages#home"
  post "/create_contact", to: 'pages#create_contact'

  root to: "pages#home"
end
