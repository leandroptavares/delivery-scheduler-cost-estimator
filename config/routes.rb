Rails.application.routes.draw do
  root "deliveries#index"
  resources :deliveries, only: [:index, :create]
end
