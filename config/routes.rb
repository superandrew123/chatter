Rails.application.routes.draw do


  resources :posts do
    resources :comments
  end

  resources :followers, except: :edit, except: :update

  root "posts#index"
  devise_for :users, :controllers => { registrations: 'registrations' }


end
