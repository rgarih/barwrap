Rails.application.routes.draw do
  get 'places/map'
  get 'places/recommended'
  get 'places/checkin'
  resources :places, only: [:index, :show]

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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
