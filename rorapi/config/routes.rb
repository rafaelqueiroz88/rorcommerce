Rails.application.routes.draw do    
  resources :products
  resources :users
  post 'authenticate', to: 'authentication#authenticate'
end
