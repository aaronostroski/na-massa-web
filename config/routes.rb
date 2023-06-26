Rails.application.routes.draw do
  devise_for :admins

  root 'site/home#index', as: :site_home

  scope module: :site do
    post 'cart/add_product/:id', to: 'cart#add_product', as: :cart_add_product
    post 'cart/remove_product/:id',
         to: 'cart#remove_product',
         as: :cart_remove_product
    delete 'cart/remove_all_products/:id',
           to: 'cart#remove_all_products',
           as: :cart_remove_all_products
    get 'finish_order', to: 'order#finish', as: :site_finish_order
    resources :order_infos, only: [:create], as: :site_create_order_infos
    resources :addresses, only: [:create], as: :site_create_addresses
  end

  namespace :admin do
    root 'admins#index'
    resources :admins, except: [:show]
    resources :banners, except: [:show]
    resources :categories, except: [:show]
    resources :products, except: [:show]
  end
end
