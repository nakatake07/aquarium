Rails.application.routes.draw do
  devise_for :admins

	 get 'top' => 'tops#top'

  devise_for :users
  #devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buyers, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :piranhas, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :genres, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :leave, :update, :destroy] do
    get 'leave', to: 'users#leave', on: :member
    end
end
