Rails.application.routes.draw do
  root to: "home#index"
  devise_for :customers, controllers: { registrations: 'registrations' }
  resources :products do
    resources :issues
    resources :reviews
  end
end
