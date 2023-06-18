Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do 
    resources :orders, only: [:new, :create] do
      resources :address, only: [:new, :create]
    end
  end
end
