Rails.application.routes.draw do
  get 'places/map'
  get 'places/index'
  get 'places/recommended'
  get 'places/checkin'
  get 'dashboard/profile'
  get 'dashboard/edit'
  get 'dashboard/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
