Rails.application.routes.draw do
  devise_for :users
  root to: 'static#home'
  
  get '/data_entry', to: 'static#data_entry'
  get '/search', to: 'specimen#search'
  get '/admin', to: 'admin#index'
  
  get 'create_user', to: 'admin#create'
  
  resources :specimen
end