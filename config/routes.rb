Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions'
  }
  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    resources :users do
      resources :boats
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :jobs
  post '/assignjob', to: "jobs#assignjob"
end
