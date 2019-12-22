Rails.application.routes.draw do
  get 'buyerinquires/new'
  devise_for :admins

	 get 'top' => 'tops#top'

  devise_for :users
  #devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :leave, :update, :destroy] do
  get 'leave', to: 'users#leave', on: :member
  end
  resources :inquires, only: [:new, :show, :create, :index, :update, :destroy]

  resources :buyers, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :buyerinquires, only: [:new, :create,  :edit, :destroy, :update]
  resources :piranhas, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
  resource :favorites, only: [:create, :destroy]
  end
  resources :genres, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :reviews, only: [:create, :destroy, :edit, :update]
  get 'favorites' => 'favorites#index'
end
