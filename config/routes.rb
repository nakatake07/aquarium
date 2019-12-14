Rails.application.routes.draw do
  devise_for :admins, controller: {
        sessions: 'admins/sessions'
    }

	 get 'top' => 'tops#top'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :piranhas, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :genres, only: [:new, :create, :index, :destroy, :update]
  resources :users, only: [:show, :edit, :leave, :update, :destroy] do
    get 'leave', to: 'users#leave', on: :member
    end
end
