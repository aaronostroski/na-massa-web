Rails.application.routes.draw do
  devise_for :admins

  root 'site/home#index', as: :site_home

  scope module: :site do
    post 'cart/add_product/:id', to: 'cart#add_product', as: :cart_add_product
  end

  namespace :admin do
    root 'admins#index'
    resources :admins, except: [:show]
    resources :banners, except: [:show]
    resources :categories, except: [:show]
    resources :products, except: [:show]
  end
end
