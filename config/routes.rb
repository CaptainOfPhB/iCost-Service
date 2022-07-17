Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource  :validation_code, only: [:create]
      resource  :session,         only: [:create, :destroy]
      resource  :user,            only: [:create, :show]
      resources :accounts
      resources :tags,            only: [:create, :update, :destroy, :index]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
