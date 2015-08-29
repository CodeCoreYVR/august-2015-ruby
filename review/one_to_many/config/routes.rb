Rails.application.routes.draw do
  root "hotels#index"
  resources :hotels, only: [:index, :new, :create, :show]
end
