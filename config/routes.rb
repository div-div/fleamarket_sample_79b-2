Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "home#index"
  # resources :users
  # get 'new_user_session_path', to: 'sessions#new'
  # post 'user_session_path', to: 'sessions#create'
  resources :items, only: [:new, :create, :show, :edit, :update, :delete]

end
