Rails.application.routes.draw do
  devise_for :users
  root to: 'static#home'
  
  get '/data_entry', to: 'static#data_entry'
end