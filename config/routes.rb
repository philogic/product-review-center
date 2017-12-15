Rails.application.routes.draw do
  get 'home/index'

  devise_for :customers, controllers: { registrations: 'registrations' }
  root to: "home#index"
end
