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
  delete '/users/:user_id/boats/:id/removejob', to: "boats#removejob", as: :removejob
  post '/assignjob', to: "jobs#assignjob"
end
