Rails.application.routes.draw do


  resources :posts do
    resources :comments
  end

  resources :followers, except: [:edit, :update]
  root "posts#index"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]

  post 'users/search' => 'users#search', as: 'search_users'

end
