Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "recipes#index"

  post "recipes", to: "recipes#post_edaman"
  get "results", to: "recipes#results"
end
