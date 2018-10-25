Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :groups, only: %i[index create update destroy] do
      resources :members, only: %i[create]
      resources :documents, only: %i[create]
    end
    resources :members, only: %i[destroy]
    resources :documents, only: %i[index update destroy]
    mount_devise_token_auth_for "User", at: "auth", controllers: {
      registrations: "api/auth/registrations"
    }
  end
end
