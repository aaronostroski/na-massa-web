Rails.application.routes.draw do
  devise_for :admins

  root 'site/home#index', as: :site_home

  # scope module: :site do
  #   get :about, to: 'about#index'
  #   get :servicos, to: 'home#services', as: :services
  #   get :trabalhos, to: 'jobs#index', as: :jobs
  #   get "/trabalhos/profissionais/:id", to: 'jobs#detail', as: :job_detail
  #   post "/trabalhos/profissionais/iniciar", to: 'jobs#start', as: :job_start

  #   get "/checkout/:service_id", to: 'checkout#index', as: :checkout
  #   post "/checkout/create", to: 'checkout#create', as: :checkout_create
  #   get "/checkout/details/:id", to: 'checkout#details', as: :checkout_details
  # end

  namespace :admin do
    root "admins#index"
    resources :admins, except: [:show]
  end
end
