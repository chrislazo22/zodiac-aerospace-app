Rails.application.routes.draw do
  root to: 'static#home'
  resources :specimen
  
  devise_for :users, skip: [:registrations]
  as :user do
    get 'admin/new', to: 'admin#new', as: 'admin_new'
    post 'admin/create', to: 'admin#create', as: 'admin_create'
  end
  
  devise_scope :user do 
    get "/admin/dashoboard" => "admin#dashboard", as: 'admin_dashboard'
    get '/admin', to: 'admin#index'
  end
  
  get '/data_entry', to: 'static#data_entry'
  get '/search', to: 'specimen#search'
  get '/instructions', to: 'static#instruction'
end
