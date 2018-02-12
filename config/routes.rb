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
  
resources :users, except: [:new, :create, :index]
  
  get 'admin/login', to: 'sessions#newadmin'
  post 'admin/login', to: 'sessions#createadmin'
  delete 'logoutadmin', to: 'sessions#destroyadmin'
  
  get 'login', to: 'sessions#newuser'
  post 'login', to: 'sessions#createuser'
  delete 'logout', to: 'sessions#destroyuser'
  
  resources :services
  
  resources :fields
  
  resources :inquieries
  
  get 'dashboard', to: 'dashboards#index'
  get 'dashboard/inquieries', to: 'dashboards#inquieries'
  get 'dashboard/inquieries/:id', to: 'dashboards#inquiery_show'
  get 'dashboard/settings', to: 'dashboards#settings'
  get 'dashboard/partners', to: 'dashboards#partners'
  get 'dashboard/partners/new', to: 'dashboards#partners_new'
  get 'dashboard/settings', to: 'dashboards#settings'
  post 'dashboard/settings', to: 'dashboards#user_update', as: 'update_user'
  
  delete '/inquieries/:id/:user_id', to: 'inquieries#detach', as: 'detach_user'
  
  post   '/partners/:id', to: 'users#attach', as: 'attach_partner'
  delete '/partners/:id/:partner_id', to: 'users#detach', as: 'detach_partner'
end
