Rails.application.routes.draw do
  resources :recipes

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  get 'visitors/about', as: :about
  get 'visitors/contact', as: :contact
  get 'visitors/join', as: :join
  get 'visitors/rules', as: :rules

  devise_for :users
  resources :users

  resources :recipes
  patch '/recipes/:id/clear_date' => 'recipes#clear_date', as: :clear_date
end
