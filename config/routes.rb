Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "admin/admins#index"

  namespace :admin do
    root "admins#index"
    resources :admins, except: [:show]
  end
end
