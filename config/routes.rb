Rails.application.routes.draw do


  resources :posts do
    resources :comments
  end

  resources :followers, except: [:edit, :update]
  resources :users, only: :show
  root "posts#index"
  devise_for :users, :controllers => { registrations: 'registrations' }


end
