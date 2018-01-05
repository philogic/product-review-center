Rails.application.routes.draw do
  get 'messages/index'

  post 'messages/create'

  get 'messages/show'

  root to: "home#index"
  devise_for :customers, controllers: { registrations: 'registrations' }
  resources :products do
    resources :issues
    resources :reviews
  end
end
