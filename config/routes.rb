Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :missions, only: :index

  get "/scan", to: "pages#scan"
  get "/admin", to: "pages#admin"
  post "execute_seeds", to: "pages#execute_seeds"
end
