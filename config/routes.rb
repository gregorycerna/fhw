Rails.application.routes.draw do
  resources :recipes

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :recipes
  get 'visitors/about', as: :about
  get 'visitors/contact', as: :contact
  get 'visitors/join', as: :join
  get 'visitors/rules', as: :rules
end
