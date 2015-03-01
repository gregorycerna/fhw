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
  resources :ingredients
  patch '/recipes/:id/clear_date' => 'recipes#clear_date', as: :clear_date

  # labor stuff
  patch 'violations/:id/settle' => 'violations#settle', as: :settle_violation
  patch 'violations/:id/unsettle' => 'violations#unsettle', as: :unsettle_violation
  get 'violations' => 'violations#index', as: :violations
  shallow do
    resources :labors do
      resources :tasks
      resources :violations, except: [:index]
      resources :dids do
        resources :checkoffs
      end
    end
  end

  # maintenance stuff
  resources :maintenance_requests
  get 'completed-maintenance-requests' => 'maintenance_requests#dones', as: :done_maintenance_requests
  patch 'maintenance_requests/:id/finish' => 'maintenance_requests#finish', as: :finish_maintenance_request
  patch 'maintenance_requests/:id/unfinish' => 'maintenance_requests#unfinish', as: :unfinish_maintenance_request
end
