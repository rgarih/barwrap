Rails.application.routes.draw do
  get 'places/map'
  get 'places/index'
  get 'places/recommended'
  get 'places/checkin'
  devise_for :users
  root to: 'pages#home'
  resources :places, only: [:map, :index]
  resources :places ,only: [:show] do
    resources :places, only: [:chekin]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
