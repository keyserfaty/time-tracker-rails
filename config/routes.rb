Rails.application.routes.draw do
  namespace :admin do
    resources :posts
    resources :users
    resources :admin_users

    root to: "posts#index"
  end

  resources :posts, skip: [:registrations]
  devise_for :remove_tables
  devise_for :add_type_to_users
  devise_for :users
  root to: 'static#homepage'
end
