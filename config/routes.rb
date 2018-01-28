Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'root', to: 'users#new'
  
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users/:username', to: 'users#page'
  get 'dashboard', to: 'users#index'
  get 'dashboard/edit',  to: 'users#edit'
  post 'dashboard/edit', to: 'users#update'
  
  get 'admin', to: 'admins#index'
  get 'admin/new', to: 'admins#new'
  post 'admin', to: 'admins#create'
  
  get 'admin/login', to: 'sessions#newadmin'
  post 'admin/login', to: 'sessions#createadmin'
  delete 'logout', to: 'sessions#destroyadmin'
  
  resources :services
  
  resources :fields
end
