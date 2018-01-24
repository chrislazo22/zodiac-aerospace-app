Rails.application.routes.draw do
  root to: 'static#home'
  resources :specimen
  resources :searches

  devise_for :users, skip: [:registrations]
  as :user do
    get 'admin/new', to: 'admin#new', as: 'admin_new'
    post 'admin/create', to: 'admin#create', as: 'admin_create'
    match 'admin/:id', to: 'admin#destroy', via: :delete, as: :admin_destroy_user
  end

  devise_scope :user do
    get "/admin/dashoboard" => "admin#dashboard", as: 'admin_dashboard'
    get '/admin', to: 'admin#index'
    get 'user/:id', to: 'admin#show', as: 'user'
  end

  get '/data_entry', to: 'static#data_entry'
  get '/search', to: 'searches#simple_search', as: 'simple_search'
  get '/instructions', to: 'static#instructions'
end
