Rails.application.routes.draw do
  get 'credit_cards/index'
  get 'credit_cards/new'
  post 'credit_cards/create'
  post 'credit_cards/edit'
  get 'credit_cards/delete'
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
  # resources :users, only:[:edit, :update, :index] do
  #   resources :credit_cards, only: [:index, :new, :create, :edit, :delete]
  # end
  resources :items, only:[:index, :new, :create, :show, :edit, :update] do
    resources :purchases, only:[:index] do
      collection do
        post 'payment', to: 'purchases#payment'
      end
    end
  end
end
