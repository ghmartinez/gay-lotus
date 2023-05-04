Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :missions, only: :index

  get "/scan", to: "pages#scan"
end
