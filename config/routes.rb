Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'

  # static pages
  root to: 'visitors#index'
  get 'visitors/about', as: :about
  get 'visitors/contact', as: :contact
  get 'visitors/join', as: :join
  get 'visitors/rules', as: :rules

  # login stuff
  devise_for :users
  resources :users

  # kitchen management stuff
  resources :recipes
  patch '/recipes/:id/clear_date' => 'recipes#clear_date', as: :clear_date

  # labor stuff
  resources :checkoffs
  resources :dids
  resources :tasks
  resources :labors

end
