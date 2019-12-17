Rails.application.routes.draw do
  devise_for :admins

	 get 'top' => 'tops#top'

  devise_for :users
  #devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :leave, :update, :destroy] do
  get 'leave', to: 'users#leave', on: :member
  end

  resources :buyers, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :piranhas, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :genres, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :reviews, only: [:create, :destroy, :edit, :update]
  post 'favorites/:piranha_id', to:'favorites#create', as: 'create_favorites'
  delete  'favorites/:piranha_id', to:'favorites#destroy', as:'destroy_favorites'

end
