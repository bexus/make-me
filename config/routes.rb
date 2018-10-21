Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :documents
    resources :members
    resources :groups
    mount_devise_token_auth_for "User", at: "auth", controllers: {
      registrations: "api/auth/registrations"
    }
  end
end
