Rails.application.routes.draw do


  devise_for :users
  resources :articles

  root 'static_pages#index'


end
