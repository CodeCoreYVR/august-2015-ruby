Rails.application.routes.draw do
  root "home#lol"
  get "/contacts" => "contacts#new"
  post "/contacts" => "contacts#create"
end
