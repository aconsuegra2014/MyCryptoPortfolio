Rails.application.routes.draw do
  resources :transactions
  resources :crypto_currencies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
