Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "institutions", to: "institution#index"
  get "institution/:id", to: "institution#show"
  post "institution/:category_id", to: "institution#create"

  get "categories", to: "category#index"
  get "category/:id", to: "category#show"
  post "category", to: "category#create"

  get "ratings", to: "rating#index"
  get "rating/:id", to: "rating#show"
  post "rating/:user_id/:institution_id", to: "rating#create"

  get "projects", to: "project#index"
  get "project/:id", to: "project#show"
  post "project/:institution_id", to: "project#create"
end
