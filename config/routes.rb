Rails.application.routes.draw do
  resources :transactionhistories
  devise_for :users , controllers: {
    registrations: 'user/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/transactions' , to: 'transactions#index' , as: 'transaction'
  get '/topups' , to: 'transactionhistories#topup', as: 'topup'
 root to: 'transactionhistories#index'
end
