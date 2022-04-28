Rails.application.routes.draw do

  namespace :admin do
    resources :users, except: [:show]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :tasks do
    collection do
      get :sort
      get :search
    end
  end
  root 'users#new'
end
