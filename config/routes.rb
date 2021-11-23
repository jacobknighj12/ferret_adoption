Rails.application.routes.draw do
  resources :categories
  resources :items
  devise_for :users
  resources :ferrets
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  end
  root to: "ferrets#index"
  get "/ferrets/new", to: "ferret#new"
  get "/ferrets/:id", to: "ferret#show"
  get "/ferrets/adopted", to: "ferrets#adopted"
  post "/ferrets/create", to: "ferret#create"
  get "/ferrets", to: "ferrets#index"
  get "/users", to: "users#index"
  get "/about", to: "about#about"
  get "/about/fees", to: "about#fees"
  get "/about/wait_list", to: "about#wait_list"
  get "/payments/success", to: "payments#success"
end
