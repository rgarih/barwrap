Rails.application.routes.draw do
  resources :places, only: [:index]
  get 'places/map'
  get 'places/recommended'
  get 'places/checkin'
  resources :users , only:[:index] do

  devise_for :users
  root to: 'pages#home'
  resources :dashboard do
    member do
      get 'profile'
    end
  end

  resources :users, only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
