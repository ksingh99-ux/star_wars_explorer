Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"

  resources :people,    only: [:index, :show]
  resources :planets,   only: [:index, :show]
  resources :species,   only: [:index, :show]
  resources :starships, only: [:index, :show]
  resources :vehicles,  only: [:index, :show]

  get "up" => "rails/health#show", as: :rails_health_check
end
