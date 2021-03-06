Rails.application.routes.draw do
  root "users#index"

  get "/getting_started", to: "pages#getting_started"

  get "/auth/github/callback", to: "sessions#create"
  get "/login" => redirect("/auth/github"), as: :login

  get "/logout" => "sessions#destroy", as: :logout

  namespace "api" do
    resource :users, only: [:update]
  end

  resources :users, only: [:index, :show]
end
