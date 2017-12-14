Rails.application.routes.draw do
  get 'home/index'

  devise_for :customers
  root to: "home#index"
end
