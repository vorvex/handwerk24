Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'userinterfaces#index'
  
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users/:username', to: 'users#page'
  get 'dashboard', to: 'users#index'
  get 'dashboard/services', to: 'users#services'

  get 'suche/gartenarbeit', to: 'searches#gartenarbeit'
  post 'suche/gartenarbeit', to: 'searches#searchgarten'
  
  get 'suche/hauswohnung', to: 'searches#hauswohnung'
  post 'suche/hauswohnung', to: 'searches#searchhaus'
  
  get 'suche/bodenbelag', to: 'searches#bodenbelag'
  post 'suche/bodenbelag', to: 'searches#searchboden'
  
  get 'suche/aussen', to: 'searches#aussen'
  post 'suche/aussen', to: 'searches#searchaussen'
  
  post 'vielendank', to: 'searches#create'
  
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
  
  post   '/partners/:id', to: 'users#attach', as: 'attach_partner'
  delete '/partners/:id/:partner_id', to: 'users#detach', as: 'detach_partner'
end
