Rails.application.routes.draw do

  get 'messages/index'
  get 'messages/new'
  post 'messages/create'
  root to: "home#index"
  devise_for :customers, controllers: { registrations: 'registrations' }
  resources :products do
    resources :issues
    resources :reviews
  end
end
