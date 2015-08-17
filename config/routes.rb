Rails.application.routes.draw do

  devise_for :users
  resources :users

  resources :categories  
  resources :articles

# Отправка комментариев
  match "/comment_create", via: [:get, :post], :to => 'articles#comment_create'

  get "/index.html", to: "static_pages#index"
  get "/contacts.html", to: "static_pages#contacts"

  root 'static_pages#index'


end
