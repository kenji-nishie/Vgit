Rails.application.routes.draw do
  devise_for :users
  root  'groups#index'
  resources :users, only: [:edit, :update, :index]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create, :update]

    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
  resources :messages, only: [:index, :create] do
    resources :comments, only: [:index, :create]
  end
  
end
