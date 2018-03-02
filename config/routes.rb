Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end

    resources :users do
      resources :boats
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :jobs
end
