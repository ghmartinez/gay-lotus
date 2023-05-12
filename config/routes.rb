Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :missions, only: :index

  get "/scan", to: "pages#scan"
  get "/admin", to: "pages#admin"
  post "add_missions_to_users", to: "pages#add_missions_to_users"
end
