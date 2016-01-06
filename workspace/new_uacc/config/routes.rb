Rails.application.routes.draw do
  root to: 'home#index'

  resources :auth, only: [:index, :create, :destroy]
  match '/auth',    to: 'auth#index',   via: 'get'
  match '/signin',  to: 'auth#create',  via: 'post'
  match '/signout', to: 'auth#destroy', via: 'delete'

  resources :search, only: [:index]
  resources :account, id: /[\w_\.\-]+/ do
    get :status
    post :unlock
    post :reset
  end
end
