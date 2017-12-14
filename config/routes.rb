Rails.application.routes.draw do
  devise_for :customers
  root to: "home#index"
end
