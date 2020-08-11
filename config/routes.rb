  Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
  resources :users, only:[:show]

  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: "items#index"
  resources :items, only:[:index, :new, :create, :show, :edit, :update] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :purchases, only:[:index] do
      collection do
        post 'payment', to: 'purchases#payment'
        get 'confirmation', to: 'purchases#confirmation'
      end
    end
  end
end
