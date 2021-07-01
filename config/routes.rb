Rails.application.routes.draw do
  get 'home/about' => 'homes#about'
  root 'homes#top'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  get 'search' => 'searches#search'
end