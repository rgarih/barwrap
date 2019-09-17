Rails.application.routes.draw do

  get 'places/map'
  get 'places/index'
  get 'places/recommended'
  get 'places/checkin'

  devise_for :users
  root to: 'pages#home'
  resources :dashboard do
    member do
      get 'profile'
      get 'friend_list'
    end
  end

  resources :users, only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
