Rails.application.routes.draw do


  get 'places/recommended'
  resources :check_ins, only:[:index]
  authenticated :user do
    root :to => "check_ins#index"
  end

  resources :places, only: [:index]
  resources :places, only: [:show] do
    put :favorite, on: :member
    resources :check_ins, only:[:new, :create]
  end

  resources :check_ins, only: [] do
    collection do
      get :new_checkin
      post :create_checkin
    end
  end


  resources :users , only:[:index, :edit, :update] do
    member do
      post :follow
      post :unfollow
    end
  end



  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  resources :dashboard do
    member do
      get 'profile'
      get 'friend_list'
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :check_ins, only: [ :index ]
      resources :places, only: [ :index ]
    end
  end
end
