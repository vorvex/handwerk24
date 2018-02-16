Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'userinterfaces#index'
  
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  
  get 'users/:username', to: 'users#page'
  
  get 'user', to: 'users#index'
  get 'user/services', to: 'users#services'

  get 'suche', to: 'tools#search'  
  post 'vielendank', to: 'tools#create'
  
  get 'admin', to: 'admins#index'
  get 'admin/new', to: 'admins#new'
  post 'admin', to: 'admins#create'
  
resources :users, except: [:new, :create, :index, :update]
  
  patch 'user/:id/edit', to: 'users#update', as: 'update_user_admin'
  
  get 'admin/login', to: 'sessions#newadmin'
  post 'admin/login', to: 'sessions#createadmin'
  delete 'logoutadmin', to: 'sessions#destroyadmin'
  
  get 'login', to: 'sessions#newuser'
  post 'login', to: 'sessions#createuser'
  get 'logout', to: 'sessions#destroyuser'
  
  resources :services
  
  resources :service_categories
  
  resources :service_subcategories
  
  resources :service_subjects
  
  resources :fields
  
  resources :inquieries
  
  get 'dashboard', to: 'dashboards#index'
  get 'dashboard/inquieries', to: 'dashboards#inquieries'
  get 'dashboard/inquieries/:id', to: 'dashboards#inquiery_show'
  get 'dashboard/publicinquieries', to: 'dashboards#public_inquieries'
  get 'dashboard/partners', to: 'dashboards#partners'
  get 'dashboard/partners/new', to: 'dashboards#partners_new'
  post 'dashboard/partners/new', to: 'partner_requests#create', as: 'new_partner_request'
  get 'dashboard/settings', to: 'dashboards#settings'
  post 'dashboard/settings', to: 'dashboards#user_update', as: 'update_user'
  post 'dashboard/settings', to: 'dashboards#password_update', as: 'update_password'
  get 'dashboard/settings/services', to: 'dashboards#services'
  post 'dashboard/settings/services', to: 'service_requests#create', as: 'new_service_request'
  get 'dashboard/support', to: 'dashboards#support'
  post 'dashboard/support', to: 'supports#create', as: 'new_support'
  
  get 'dashboard/reset-password/', to: 'dashboards#reset_password'
  get 'passwort-vergessen', to: 'dashboards#forgot_password'
  
  delete '/inquieries/:id/:user_id', to: 'inquieries#detach', as: 'detach_user'
  
  post   '/partners/:id', to: 'users#attach', as: 'attach_partner'
  delete '/partners/:id/:partner_id', to: 'users#detach', as: 'detach_partner'
end
