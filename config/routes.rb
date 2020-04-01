Rails.application.routes.draw do
  root to: "sessions#new"
  resources :feeds do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :show]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy" 
end
