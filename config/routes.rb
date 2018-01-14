Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users/:username', to: 'users#page'
  get 'users', to: 'users#index'
  get 'amdin', to: 'admin#index'
end
