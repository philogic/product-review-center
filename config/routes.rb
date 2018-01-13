Rails.application.routes.draw do

  resources :messages, only: [:index, :new, :create]
  root to: "home#index"
  devise_for :customers, controllers: { registrations: 'registrations' }
  resources :products do
    resources :issues
    resources :reviews
  end
end
