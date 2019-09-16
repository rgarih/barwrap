Rails.application.routes.draw do

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
