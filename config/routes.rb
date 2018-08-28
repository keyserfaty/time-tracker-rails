Rails.application.routes.draw do
  resources :posts
  devise_for :remove_tables
  devise_for :add_type_to_users
  devise_for :users
  root to: 'static#homepage'
end
