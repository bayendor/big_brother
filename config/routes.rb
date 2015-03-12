Rails.application.routes.draw do
  root "pages#index"

  get "/auth/github/callback", to: "sessions#create"
  get "/login" => redirect("/auth/github"), as: :login

  get "/logout" => "sessions#destroy", as: :logout
end
