Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "ferrets#index"
  get "/ferrets", to: "ferrets#index"
end
