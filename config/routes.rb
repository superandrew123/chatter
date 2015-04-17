Rails.application.routes.draw do


  resources :posts do
    resources :comments
  end

  resources :followers, except: [:edit, :update]
  

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]

  post 'users/search' => 'users#search', as: 'search_users'
  get 'expired' => 'posts#change_expired', as: 'change_expired'
  get 'followers_posts' => 'posts#followers_index', as: 'followers_index'
  get 'following_posts' => 'posts#following_index', as: 'following_index'
  get 'filter_index' => 'posts#filter', as: 'filter'

  root "posts#filter"
end
