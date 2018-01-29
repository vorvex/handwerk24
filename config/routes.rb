Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'users#new'
  
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users/:username', to: 'users#page'
  get 'dashboard', to: 'users#index'

  
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
end
