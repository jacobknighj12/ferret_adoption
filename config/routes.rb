Rails.application.routes.draw do
  devise_for :users
  resources :ferrets
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  end
  root to: "ferrets#index"
  get "/ferrets/new", to: "ferret#new"
  get "/ferrets/:id", to: "ferret#show"
  post "/ferrets/create", to: "ferret#create"
  get "/ferrets", to: "ferrets#index"
  get "/users", to: "users#index"
  
  get "/payments/success", to: "payments#success"
end
