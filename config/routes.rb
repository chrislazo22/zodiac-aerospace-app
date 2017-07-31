Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  root to: 'static#home'
  
  get '/data_entry', to: 'static#data_entry'
  get '/search', to: 'specimen#search'
  get '/admin', to: 'admin#index'
  
  get '/create_user', to: 'admin#create_user'
  
  resources :specimen
end