Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :validation_codes, only: [:create]
      resource :session, only: [:create, :destroy]
      resources :user, only: [:show]
      resources :accounts
      resources :tags
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
