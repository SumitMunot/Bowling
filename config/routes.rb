Rails.application.routes.draw do
  resources :users
  resources :games do
  	resources :casings
  end
  root to: 'games#index'
end
