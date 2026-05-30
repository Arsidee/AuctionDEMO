Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" }
  devise_for :admin_users, path: "admins",
    controllers: { sessions: "admin_users/sessions" },
    path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }

  root to: "auctions#index"

  resources :auctions, only: [:index, :show] do
    resources :lots, only: [:show] do
      resources :bids, only: [:create]
    end
  end

  namespace :admin do
    root to: "auctions#index"
    resources :auctions do
      resources :lots
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
