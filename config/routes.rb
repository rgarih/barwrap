Rails.application.routes.draw do
  resources :places, only: [:index]
  get 'places/map'
  get 'places/recommended'
  get 'places/checkin'
<<<<<<< HEAD
  get 'places/show'


=======
  resources :users do
    member do
      post :follow
      post :unfollow
    end
  end
>>>>>>> 9f3a7639c5226ba582a550273349b9b565621957

  devise_for :users
  root to: 'pages#home'
  resources :dashboard do
    member do
      get 'profile'
      get 'friend_list'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
