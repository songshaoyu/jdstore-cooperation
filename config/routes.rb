Rails.application.routes.draw do
  devise_for :users
  resources :carts
  
  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

   root 'products#index'
end
