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

  root to: "items#index"
  resources :items, only:[:index, :new, :create, :show, :edit, :update] do
    resources :purchases, only:[:index] do
      collection do
        post 'payment', to: 'purchases#payment'
      end
    end
  end
end
