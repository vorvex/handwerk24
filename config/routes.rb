Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users/:username', to: 'users#page'
  get 'dashboard', to: 'users#index'
  get 'dashboard/edit',  to: 'users#edit'
  post 'dashboard/edit', to: 'users#update'
  get 'admin', to: 'admin#index'
  
  resources :services
  
  resources :fields
end
